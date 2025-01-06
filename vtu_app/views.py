from django.http import JsonResponse
from django.shortcuts import render, redirect
from .forms import RegistrationForm, LoginForm
from django.contrib.auth import authenticate, login
from django.contrib.auth.decorators import login_required
from .models import (
    Airtime, AirtimePinPrice, AlphaTopupPrice, ApiConfig, ApiLink, CableID, CablePlan,
    Contact, Crypto, DataPin, DataPlan, DataToken, ElectricityID, ExamID, NetworkID, CustomUser, Account
)


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
    return render(request, 'profile.html', {'user': request.user})

@login_required
def logout(request):
    return render(request, 'login.html')

@login_required
def fund_wallet(request):
    return render(request, 'fund_wallet.html')

@login_required
def buy_airtime(request):
    pass

@login_required
def buy_data_pin(request):
    pass

@login_required
def get_data_plans(request):
    network_id = request.GET.get('network_id')
    data_type = request.GET.get('data_type')
    print(network_id, data_type)

    if network_id and data_type:
        plans = DataPlan.objects.filter(datanetwork=network_id, atype=data_type)
        for i in plans:
            print(type(i))
        print(plans)
        plan_list = list(plans.values('pId', 'name', 'atype', 'userprice', 'day'))
        print(plan_list)
        return JsonResponse({'plans': plan_list})

    return JsonResponse({'error': 'Invalid parameters'}, status=400)

@login_required
def buy_data(request):
    # Fetch all networks where networkStatus is 'On'
    data = NetworkID.objects.filter(networkStatus='On')
    for network in data:
        if network.networkStatus == "On":
            print(f'dtata from buy_data: {network.nId}')

    context = {
        'data': data,
    }
    return render(request, 'buy_data.html', context)

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
def transactions(request):
    pass

@login_required
def pricing(request):
    pass

# def login(request):
#     return render(request, 'login.html')
