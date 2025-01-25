from django.http import JsonResponse
from decimal import Decimal
import uuid
import datetime
from django.contrib import messages
import requests
from django.shortcuts import render, redirect, get_object_or_404
from .forms import RegistrationForm, LoginForm
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from .models import (
    Airtime, AirtimePinPrice, AlphaTopupPrice, ApiConfig, ApiLink, CableID, CablePlan,
    Contact, Crypto, DataPin, DataPlan, DataToken, ElectricityID, ExamID, NetworkID, CustomUser, Account,Transactions
)
def generate_transaction_id():
    # Get current timestamp
    timestamp = datetime.datetime.now().strftime("%Y%m%d%H%M%S")
    # Generate a random UUID and take the first 8 characters
    unique_id = str(uuid.uuid4())[:8].upper()
    # Combine timestamp and unique ID
    transaction_id = f"TXN{timestamp}{unique_id}"
    return transaction_id

def home(request):
    return render(request, 'index.html')

def register(request):
    if request.method == 'POST':
        form = RegistrationForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            user.set_password(form.cleaned_data['password'])  # Hash password

            form.save()
            return redirect('login')
    else:
        form = RegistrationForm()
    return render(request, 'register.html', {'form': form})

# Login View
def user_login(request):
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

@login_required
def main_page(request):
    context = {
        'user': request.user,
    }
    return render(request, 'main_page.html', context)

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
        amount = Decimal(request.POST.get('amount'))
        bypass = request.POST.get('ported_number') == 'on'
        user = request.user

        if user.balance >= amount:


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

                if res.get('status') == 'fail':
                    # Airtime purchase successful
                    # Deduct amount from user balance
                    user.balance -= amount
                    user.save()
                    # Create a transaction record
                    transaction = Transactions.objects.create(
                        user=user,
                        service_name='Airtime',
                        transaction_id=request_id,
                        amount=amount,
                        status='completed',
                        description=f"Airtime of {amount} for {phone} on {network} network."
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
        plan_list = list(plans.values('pId', 'name', 'atype', 'userprice', 'day'))

        return JsonResponse({'plans': plan_list})

    return JsonResponse({'error': 'Invalid parameters'}, status=400)

@login_required
def buy_data(request):
    # getting api key from database
    api_key = ApiConfig.objects.get(name='data_api')

    if request.method == 'POST':
        network = request.POST.get('network')
        data_plan = request.POST.get('dataplan')
        phone = request.POST.get('phone')
        bypass = request.POST.get('ported_number') == 'on'
        amount_to_pay = request.POST.get('amounttopay')
        request_id = generate_transaction_id()
        print(f"network is {network}, data_plan: {data_plan}, phone: {phone}, bypass: {bypass}, amount_to_pay: {amount_to_pay}, request_id is {request_id}")

        # Define the payload
        payload = {
            'network': network,
            'phone': phone,
            'data_plan': data_plan,
            'bypass': bypass,
            'request-id': generate_transaction_id()
        }

        # Define the headers
        headers = {
            'Authorization': f'Token {api_key}',
            'Content-Type': 'application/json'
        }

        # Make the POST request
        url = 'https://n3tdata.com/api/data'
        user = request.user
        if user.balance >= Decimal(amount_to_pay):
            try:
                # integete the api to buy data
                response = requests.post(url, json=payload, headers=headers)

                res = response.json()
                if res.get('status') == 'fail':
                    print('from succes if', res)
                    user.balance -= Decimal(amount_to_pay)
                    user.save()
                    dis_data = DataPlan.objects.filter(datanetwork=network, planid=data_plan).first()

                    if dis_data:
                        # get history
                        transaction = Transactions.objects.create(
                            user=user,
                            service_name=f"{dis_data.atype} Data",
                            transaction_id=request_id,
                            amount=Decimal(amount_to_pay),
                            status='completed',
                            description=f"{dis_data.name} {dis_data.atype} {dis_data.day} purchased for {phone}")
                        print(transaction)

                    messages.success(request, 'You have successfully purchased data.')
                else:
                    messages.error(request, f"Data purchase failed: {res.get('message', 'Unknown error')}")
            except Exception as e:
                print('Network error: API call failed')
                messages.error(request, 'Network error: Unable to complete the request.')
        else:
            messages.error(request, 'Insufficient balance to complete the purchase.')

        return redirect('buy_data')



    # Fetch all networks where networkStatus is 'On'
    data = NetworkID.objects.filter(networkStatus='On')

    context = {
        'data': data,
    }
    return render(request, 'buy_data.html', context)

@login_required
def transactions(request):
    transactions = Transactions.objects.all()
    content = {
        'datas': transactions,
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
