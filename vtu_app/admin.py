from django.contrib import admin
from .models import *

# Registering each model individually
admin.site.register(CustomUser)
admin.site.register(Account)
admin.site.register(Transactions)
admin.site.register(Airtime)
admin.site.register(AirtimePinPrice)
admin.site.register(AlphaTopupPrice)
admin.site.register(ApiConfig)
admin.site.register(ApiLink)
admin.site.register(CableID)
admin.site.register(CablePlan)
admin.site.register(Contact)
admin.site.register(Crypto)
admin.site.register(DataPin)
admin.site.register(DataPlan)
admin.site.register(DataToken)
admin.site.register(ElectricityID)
admin.site.register(ExamID)
admin.site.register(NetworkID)
