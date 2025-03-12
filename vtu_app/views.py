from .tasks import process_data_purchase
from django.http import JsonResponse
from decimal import Decimal, InvalidOperation
import uuid
import datetime
from django.contrib import messages
import requests
from django.shortcuts import render, redirect, get_object_or_404
from .forms import RegistrationForm, LoginForm
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from .models import *
from django.core.paginator import Paginator
from django.core.mail import send_mail
import logging
from django.db import transaction
from django.contrib.messages import get_messages

logger = logging.getLogger(__name__)


def generate_transaction_id():
    # Get current timestamp
    timestamp = datetime.datetime.now().strftime("%Y%m%d%H%M%S")
    # Generate a random UUID and take the first 8 characters
    unique_id = str(uuid.uuid4())[:8].upper()
    # Combine timestamp and unique ID
    transaction_id = f"TXN{timestamp}{unique_id}"
    return transaction_id

def get_messages(request):
    storage = get_messages(request)
    messages_list = [message.message for message in storage]
    return JsonResponse({"message": messages_list[0] if messages_list else ""})

def home(request):
    if request.user.is_authenticated:
        return redirect('main_page')
    return render(request, 'index.html')

def register(request):
    if request.user.is_authenticated:
        return redirect('main_page')  # Redirect already logged-in users

    if request.method == 'POST':
        form = RegistrationForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            user.set_password(form.cleaned_data['password'])  # Hash the password
            user.save()  # Save the user object
            return redirect('login')
    else:
        form = RegistrationForm()
        
    return render(request, 'register.html', {'form': form})
# Login View
def user_login(request):
    if request.user.is_authenticated:
        return redirect('main_page')

    if request.method == 'POST':
        form = LoginForm(data=request.POST)
        if form.is_valid():
            user = authenticate(
                request,
                username=form.cleaned_data['username'],
                password=form.cleaned_data['password']
            )
            if user is not None:
                login(request, user)
                return redirect('main_page')
    else:
        form = LoginForm()

    return render(request, 'login.html', {'form': form})

def contact_view(request):
    if request.method == 'POST':
        name = request.POST.get('name')
        email = request.POST.get('email')
        subject = request.POST.get('subject')
        message = request.POST.get('message')

        full_message = f"From: {name} <{email}>\n\n{message}"
        try:
            send_mail(subject, full_message, 'mederhoo@gmail.com', ['mederhoo@yahoo.com'])
            messages.success(request, 'Your message was successfully sent!')
        except Exception as e:
            messages.error(request, f"Failed to send message: {e}")

        return redirect('home')

    return redirect('home')

@login_required
def main_page(request):
    context = {
        'user': request.user,
    }
    return render(request, 'main_page.html', context)

@login_required
def coming_soon(request):
    messages.error(request, 'COMING SOON')
    return redirect('main_page')

@login_required
def profile(request):
    user = request.user
    if request.method == 'POST':
        user.first_name = request.POST.get('first_name')
        user.last_name = request.POST.get('last_name')
        user.email = request.POST.get('email')
        user.phone = request.POST.get('phone')
        user.address = request.POST.get('address')
        user.save()
        messages.success(request, 'Profile updated successfully.')
        return redirect('profile')
    return render(request, 'profile.html', {'user': user})

@login_required
def logout_view(request):
    logout(request)
    messages.success(request, 'You have been logged out successfully.')
    return redirect('login')

@login_required
def fund_wallet(request):
    return render(request, 'fund_wallet.html')

@login_required
def buy_airtime(request):
    if request.method == 'POST':
        network = request.POST.get('network')
        phone = request.POST.get('phone')
        amount = request.POST.get('amount')
        bypass = request.POST.get('ported_number') == 'on'
        pin = request.POST.get('transaction_pin')
        user = request.user

        if pin != user.pin:
            messages.error(request, 'Invalid transaction PIN. Please try again.')
            return redirect('buy_airtime')

        if user.balance >= Decimal(amount):


            # Generate a unique transaction ID for tracking
            request_id = generate_transaction_id()

            # Define the payload for the API request
            payload = {
                'network': network,
                'phone': phone,
                'plan_type': 'VTU',
                'bypass': bypass,
                'amount': amount,
                'request-id': request_id
            }

            api_key = ApiConfig.objects.get(name='data_api')
            headers = {
                'Authorization': f'Token {api_key}',
                'Content-Type': 'application/json'
            }

            # Make the POST request to the airtime API
            url = 'https://n3tdata.com/api/topup'
            try:
                response = requests.post(url, json=payload, headers=headers)
                res = response.json()
                print(f"bypass: {bypass}{res}")

                if res.get('status') == 'success':
                    # Airtime purchase successful
                    # Deduct amount from user balance
                    amount_to_pay = float(amount) - (float(amount) * 0.01)
                    user.balance -= Decimal(amount_to_pay)
                    user.save()
                    # Create a transaction record
                    transaction = Transactions.objects.create(
                        user=user,
                        service_name='Airtime',
                        transaction_id=request_id,
                        amount=Decimal(amount),
                        status='completed',
                        description=f"Airtime of {amount} for {phone} on {network} network.",
                        api_return_message=res
                    )
                    # Add success message
                    messages.success(request, 'Airtime purchased successfully!')
                else:
                    # Airtime purchase failed (API response returned 'fail' status)
                    messages.error(request, f"Failed to purchase airtime: {res.get('message', 'Unknown error')}")
            except requests.exceptions.RequestException as e:
                # Handle any request-related errors (e.g., network issues)
                messages.error(request, f"Error: Unable to complete the purchase. {str(e)}")
        else:
            # Insufficient balance
            messages.error(request, 'Insufficient balance to complete the purchase.')

        return redirect('buy_airtime')

    return render(request, 'buy_airtime.html')


@login_required
def buy_data_pin(request):
    pass

@login_required
def get_data_plans(request):
    network_id = request.GET.get('network_id')
    data_type = request.GET.get('data_type')

    if network_id and data_type:
        plans = DataPlan.objects.filter(datanetwork=network_id, atype=data_type)
        plan_list = list(plans.values('planid', 'name', 'atype', 'userprice', 'day'))

        return JsonResponse({'plans': plan_list})

    return JsonResponse({'error': 'Invalid parameters'}, status=400)

# buy data view

@login_required
def buy_data(request):
    try:
        # Get the API key
        api_key = ApiConfig.objects.get(name='data_api')

        if request.method == 'POST':
            # Extract form data
            network = request.POST.get('network')
            data_plan = request.POST.get('dataplan')
            phone = request.POST.get('phone')
            bypass = request.POST.get('ported_number') == 'on'
            amount_to_pay = request.POST.get('amounttopay')
            user = request.user
            request_id = f"{user.username}_{generate_transaction_id()}"
            pin = request.POST.get('transaction_pin')

            # Debugging: Print form data
            print(f"network is {network}, data_plan: {data_plan}, phone: {phone}, bypass: {bypass}, amount_to_pay: {amount_to_pay}, request_id is {request_id}")

            # Validate transaction PIN
            if pin != user.pin:
                messages.error(request, 'Invalid transaction PIN. Please try again.')
                return render(request, 'buy_data.html', {'data': NetworkID.objects.filter(networkStatus='On')})

            # Validate amount_to_pay
            try:
                amount_to_pay = Decimal(amount_to_pay)
            except InvalidOperation:
                messages.error(request, 'Invalid amount.')
                return render(request, 'buy_data.html', {'data': NetworkID.objects.filter(networkStatus='On')})
            
            # Check user balance
            if user.balance >= amount_to_pay:
                # Create transaction record
                dis_data = DataPlan.objects.filter(datanetwork=network, planid=data_plan).first()
                if dis_data:
                    txn = Transactions.objects.create(
                                    user=user,
                                    service_name=f"{dis_data.atype} Data",
                                    transaction_id=request_id,
                                    amount=amount_to_pay,
                                    status='pending',
                                    description=f"{dis_data.name} {dis_data.atype} {dis_data.day} purchased for {phone}",
        )
                    process_data_purchase.delay(
                        txn.transaction_id, user.username, network, data_plan, phone, bypass, request_id, str(amount_to_pay))
                    messages.success(request, "Your data purchase is being processed.")
                    return render(request, 'buy_data.html',
                                  {'data': NetworkID.objects.filter(networkStatus='On'\
)})

            else:
                # Insufficient balance
                messages.error(request, 'Insufficient balance to complete the purchase.')

            return render(request, 'buy_data.html',
                          {'data': NetworkID.objects.filter(networkStatus='On')}) 

        # Fetch all networks where networkStatus is 'On'
        data = NetworkID.objects.filter(networkStatus='On')
        return render(request, 'buy_data.html', {'data': data})

    except Exception as e:
        # Handle unexpected exceptions
        logger.error(f'Error in buy_data view: {str(e)}')
        messages.error(request, f'An internal error occurred. {str(e)}')
        return redirect('buy_data')

@login_required
def transactions(request):
    user = request.user
    transaction_list = Transactions.objects.filter(user=user)
    paginator = Paginator(transaction_list, 20)  # Show 20 transactions per page

    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    num = 1

    content = {
        'page_obj': page_obj,
        'num': num
    }
    return render(request, 'history.html', content)

@login_required
def cable_tv(request):
    pass

@login_required
def electricity(request):
    pass

@login_required
def exam_pins(request):
    pass

@login_required
def airtime2cash(request):
    pass

@login_required
def recharge_pin(request):
    pass

@login_required
def w2bank(request):
    pass


@login_required
def pricing(request):
    pass

# def login(request):
#     return render(request, 'login.html')
