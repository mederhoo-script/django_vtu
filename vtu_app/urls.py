# vtu_app/urls.py
from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('register/', views.register, name='register'),
    path('login/', views.user_login, name='login'),
    path('main/', views.main_page, name='main_page'),
    path('profile/', views.profile, name='profile'),
    path('logout/', views.logout_view, name='logout'),
    path('fund_wallet/', views.fund_wallet, name='fund_wallet'),
    path('buy_airtime/', views.buy_airtime, name='buy_airtime'),
    path('buy_data_pin/', views.logout, name='buy_data_pin'),
    path('get_data_plans/', views.get_data_plans, name='get_data_plans/'),
    path('buy_data/', views.buy_data, name='buy_data'),
    path('cable_tv/', views.cable_tv, name='cable_tv'),
    path('electricity', views.electricity, name='electricity'),
    path('exam_pins', views.exam_pins, name='exam_pins'),
    path('airtime2cash', views.airtime2cash, name='airtime2cash'),
    path('recharge_pin', views.recharge_pin, name='recharge_pin'),
    path('w2bank', views.w2bank, name='w2bank'),
    path('transactions', views.transactions, name='transactions'),
    path('pricing', views.pricing, name='pricing'),
    path('submit-contact-form/', views.contact_view, name='contact_page'),
    path('coming_soon/', views.coming_soon, name='coming_soon'),
    path('get_messages/', views.get_messages_view, name='get_messages'),


    # path('add-agent/', views.add_agent, name='add_agent'),
]
