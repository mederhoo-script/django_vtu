from django.contrib.auth.models import AbstractUser
from django.db import models

class CustomUser(AbstractUser):
    email = models.EmailField(unique=True)
    phone = models.CharField(max_length=15, unique=True, null=True)
    address = models.TextField(blank=True, null=True)
    pin = models.CharField(max_length=6)  # Transaction PIN
    balance = models.DecimalField(max_digits=12, decimal_places=2, default=0.00)
    bvn = models.CharField(max_length=11, blank=True, null=True)  # For KYC
    nin = models.CharField(max_length=11, blank=True, null=True)  # For KYC

    class Meta:
        db_table = 'users'

    def __str__(self):
        return self.username


class Account(models.Model):
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE, related_name='accounts')
    account_number = models.CharField(max_length=20, unique=True)
    account_name = models.CharField(max_length=100)
    bank_name = models.CharField(max_length=100)

    class Meta:
        db_table = 'account'

    def __str__(self):
        return f"{self.bank_name} - {self.account_number}"


class Airtime(models.Model):
    aId = models.IntegerField(primary_key=True)
    aNetwork = models.CharField(max_length=10)
    aBuyDiscount = models.FloatField(default=96)
    aUserDiscount = models.FloatField()
    aAgentDiscount = models.FloatField()
    aVendorDiscount = models.FloatField()
    aType = models.CharField(max_length=15)

    class Meta:
        db_table = 'airtime'

    def __str__(self):
        return f"{self.aType} - {self.aNetwork}"


class AirtimePinPrice(models.Model):
    aId = models.IntegerField(primary_key=True)
    aNetwork = models.CharField(max_length=10)
    aUserDiscount = models.FloatField()
    aAgentDiscount = models.FloatField()
    aVendorDiscount = models.FloatField()

    class Meta:
        db_table = 'airtimepinprice'

    def __str__(self):
        return f"{self.aNetwork} - {self.aAgentDiscount}"


class AlphaTopupPrice(models.Model):
    alphaId = models.IntegerField(primary_key=True)
    buyingPrice = models.IntegerField()
    sellingPrice = models.IntegerField()
    agent = models.IntegerField()
    vendor = models.IntegerField()
    dPosted = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'alphatopupprice'


class ApiConfig(models.Model):
    aId = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=30)
    value = models.CharField(max_length=100, null=True, blank=True)

    class Meta:
        db_table = 'apiconfigs'

    def __str__(self):
        return f"{self.name} - {self.value}"


class ApiLink(models.Model):
    aId = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=30)
    value = models.CharField(max_length=100, null=True, blank=True)
    atype = models.CharField(max_length=20, null=True, blank=True)

    class Meta:
        db_table = 'apilinks'

    def __str__(self):
        return f"{self.name} - {self.atype}"


class CableID(models.Model):
    cId = models.IntegerField(primary_key=True)
    cableid = models.CharField(max_length=10, null=True, blank=True)
    provider = models.CharField(max_length=10)
    providerStatus = models.CharField(max_length=10, default='On')

    class Meta:
        db_table = 'cableid'

    def __str__(self):
        return f"{self.provider}"


class CablePlan(models.Model):
    cpId = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=255)
    price = models.CharField(max_length=255)
    userprice = models.CharField(max_length=255)
    agentprice = models.CharField(max_length=255)
    vendorprice = models.CharField(max_length=255)
    planid = models.CharField(max_length=255)
    atype = models.CharField(max_length=255, null=True, blank=True)
    cableprovider = models.SmallIntegerField()
    day = models.CharField(max_length=255)

    class Meta:
        db_table = 'cableplans'

    def __str__(self):
        return f"{self.name} - {self.day}"


class Contact(models.Model):
    msgId = models.IntegerField(primary_key=True)
    sId = models.IntegerField()
    name = models.CharField(max_length=100)
    contact = models.CharField(max_length=200)
    subject = models.CharField(max_length=200)
    message = models.TextField()
    dPosted = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'contact'

    def __str__(self):
        return f"{self.name} - {self.contact}"


class Crypto(models.Model):
    atype = models.CharField(max_length=255)
    network = models.SmallIntegerField()
    agentrate = models.CharField(max_length=255)
    userrate = models.CharField(max_length=255)
    vendorrate = models.CharField(max_length=255)
    price = models.CharField(max_length=255)
    name = models.CharField(max_length=255)

    class Meta:
        db_table = 'crypto'

    def __str__(self):
        return f"{self.atype} - {self.name}"


class DataPin(models.Model):
    dpId = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=255)
    price = models.CharField(max_length=255)
    userprice = models.CharField(max_length=255)
    agentprice = models.CharField(max_length=255)
    vendorprice = models.CharField(max_length=255)
    planid = models.CharField(max_length=255)
    atype = models.CharField(max_length=255, null=True, blank=True)
    datanetwork = models.SmallIntegerField()
    day = models.CharField(max_length=255)

    class Meta:
        db_table = 'datapins'

    def __str__(self):
        return f"{self.atype} - {self.name}"


class DataPlan(models.Model):
    pId = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=255)
    price = models.CharField(max_length=255)
    userprice = models.CharField(max_length=255)
    agentprice = models.CharField(max_length=255)
    vendorprice = models.CharField(max_length=255)
    planid = models.CharField(max_length=255)
    atype = models.CharField(max_length=255, null=True, blank=True)
    datanetwork = models.SmallIntegerField()
    day = models.CharField(max_length=255)

    class Meta:
        db_table = 'dataplans'

    def __str__(self):
        return f"{self.atype} - {self.name}"


class DataToken(models.Model):
    tId = models.IntegerField(primary_key=True)
    sId = models.IntegerField()
    tRef = models.CharField(max_length=255)
    business = models.CharField(max_length=30)
    network = models.CharField(max_length=30)
    datasize = models.CharField(max_length=30)
    quantity = models.IntegerField()
    serial = models.TextField()
    tokens = models.TextField()
    date = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'datatokens'

    def __str__(self):
        return f"{self.network} - {self.business}"


class ElectricityID(models.Model):
    eId = models.IntegerField(primary_key=True)
    electricityid = models.CharField(max_length=50, null=True, blank=True)
    provider = models.CharField(max_length=50)
    abbreviation = models.CharField(max_length=5)
    providerStatus = models.CharField(max_length=10, default='On')

    class Meta:
        db_table = 'electricityid'

    def __str__(self):
        return f"{self.provider} - {self.abbreviation}"


class ExamID(models.Model):
    eId = models.IntegerField(primary_key=True)
    examid = models.CharField(max_length=10, null=True, blank=True)
    provider = models.CharField(max_length=50)
    price = models.IntegerField(default=0)
    buying_price = models.IntegerField(default=0)
    providerStatus = models.CharField(max_length=10, default='On')

    class Meta:
        db_table = 'examid'

    def __str__(self):
        return f"{self.provider}"


class NetworkID(models.Model):
    nId = models.IntegerField(primary_key=True)
    networkid = models.CharField(max_length=10)
    smeId = models.CharField(max_length=10)
    giftingId = models.CharField(max_length=10)
    corporateId = models.CharField(max_length=10)
    vtuId = models.CharField(max_length=10)
    sharesellId = models.CharField(max_length=10)
    network = models.CharField(max_length=20)
    networkStatus = models.CharField(max_length=10, default='Off')
    vtuStatus = models.CharField(max_length=10, default='Off')
    sharesellStatus = models.CharField(max_length=10, default='Off')
    airtimepinStatus = models.CharField(max_length=10, default='Off')
    smeStatus = models.CharField(max_length=10, default='Off')
    giftingStatus = models.CharField(max_length=10, default='Off')
    corporateStatus = models.CharField(max_length=10, default='Off')
    datapinStatus = models.CharField(max_length=10, default='Off')

    class Meta:
        db_table = 'networkid'

    def __str__(self):
        return f"{self.network}"
