# Generated by Django 4.2.10 on 2025-01-04 07:10

from django.conf import settings
import django.contrib.auth.models
import django.contrib.auth.validators
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0012_alter_user_first_name_max_length'),
    ]

    operations = [
        migrations.CreateModel(
            name='CustomUser',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('is_superuser', models.BooleanField(default=False, help_text='Designates that this user has all permissions without explicitly assigning them.', verbose_name='superuser status')),
                ('username', models.CharField(error_messages={'unique': 'A user with that username already exists.'}, help_text='Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only.', max_length=150, unique=True, validators=[django.contrib.auth.validators.UnicodeUsernameValidator()], verbose_name='username')),
                ('first_name', models.CharField(blank=True, max_length=150, verbose_name='first name')),
                ('last_name', models.CharField(blank=True, max_length=150, verbose_name='last name')),
                ('email', models.EmailField(blank=True, max_length=254, verbose_name='email address')),
                ('is_staff', models.BooleanField(default=False, help_text='Designates whether the user can log into this admin site.', verbose_name='staff status')),
                ('is_active', models.BooleanField(default=True, help_text='Designates whether this user should be treated as active. Unselect this instead of deleting accounts.', verbose_name='active')),
                ('date_joined', models.DateTimeField(default=django.utils.timezone.now, verbose_name='date joined')),
                ('phone', models.CharField(blank=True, max_length=15, null=True)),
                ('address', models.TextField(blank=True, null=True)),
                ('pin', models.CharField(max_length=6)),
                ('bvn', models.CharField(blank=True, max_length=11, null=True)),
                ('nin', models.CharField(blank=True, max_length=11, null=True)),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.group', verbose_name='groups')),
                ('user_permissions', models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.permission', verbose_name='user permissions')),
            ],
            options={
                'db_table': 'users',
            },
            managers=[
                ('objects', django.contrib.auth.models.UserManager()),
            ],
        ),
        migrations.CreateModel(
            name='Airtime',
            fields=[
                ('aId', models.IntegerField(primary_key=True, serialize=False)),
                ('aNetwork', models.CharField(max_length=10)),
                ('aBuyDiscount', models.FloatField(default=96)),
                ('aUserDiscount', models.FloatField()),
                ('aAgentDiscount', models.FloatField()),
                ('aVendorDiscount', models.FloatField()),
                ('aType', models.CharField(max_length=15)),
            ],
            options={
                'db_table': 'airtime',
            },
        ),
        migrations.CreateModel(
            name='AirtimePinPrice',
            fields=[
                ('aId', models.IntegerField(primary_key=True, serialize=False)),
                ('aNetwork', models.CharField(max_length=10)),
                ('aUserDiscount', models.FloatField()),
                ('aAgentDiscount', models.FloatField()),
                ('aVendorDiscount', models.FloatField()),
            ],
            options={
                'db_table': 'airtimepinprice',
            },
        ),
        migrations.CreateModel(
            name='AlphaTopupPrice',
            fields=[
                ('alphaId', models.IntegerField(primary_key=True, serialize=False)),
                ('buyingPrice', models.IntegerField()),
                ('sellingPrice', models.IntegerField()),
                ('agent', models.IntegerField()),
                ('vendor', models.IntegerField()),
                ('dPosted', models.DateTimeField(auto_now_add=True)),
            ],
            options={
                'db_table': 'alphatopupprice',
            },
        ),
        migrations.CreateModel(
            name='ApiConfig',
            fields=[
                ('aId', models.IntegerField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=30)),
                ('value', models.CharField(blank=True, max_length=100, null=True)),
            ],
            options={
                'db_table': 'apiconfigs',
            },
        ),
        migrations.CreateModel(
            name='ApiLink',
            fields=[
                ('aId', models.IntegerField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=30)),
                ('value', models.CharField(blank=True, max_length=100, null=True)),
                ('atype', models.CharField(blank=True, max_length=20, null=True)),
            ],
            options={
                'db_table': 'apilinks',
            },
        ),
        migrations.CreateModel(
            name='CableID',
            fields=[
                ('cId', models.IntegerField(primary_key=True, serialize=False)),
                ('cableid', models.CharField(blank=True, max_length=10, null=True)),
                ('provider', models.CharField(max_length=10)),
                ('providerStatus', models.CharField(default='On', max_length=10)),
            ],
            options={
                'db_table': 'cableid',
            },
        ),
        migrations.CreateModel(
            name='CablePlan',
            fields=[
                ('cpId', models.IntegerField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=255)),
                ('price', models.CharField(max_length=255)),
                ('userprice', models.CharField(max_length=255)),
                ('agentprice', models.CharField(max_length=255)),
                ('vendorprice', models.CharField(max_length=255)),
                ('planid', models.CharField(max_length=255)),
                ('atype', models.CharField(blank=True, max_length=255, null=True)),
                ('cableprovider', models.SmallIntegerField()),
                ('day', models.CharField(max_length=255)),
            ],
            options={
                'db_table': 'cableplans',
            },
        ),
        migrations.CreateModel(
            name='Contact',
            fields=[
                ('msgId', models.IntegerField(primary_key=True, serialize=False)),
                ('sId', models.IntegerField()),
                ('name', models.CharField(max_length=100)),
                ('contact', models.CharField(max_length=200)),
                ('subject', models.CharField(max_length=200)),
                ('message', models.TextField()),
                ('dPosted', models.DateTimeField(auto_now_add=True)),
            ],
            options={
                'db_table': 'contact',
            },
        ),
        migrations.CreateModel(
            name='Crypto',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('atype', models.CharField(max_length=255)),
                ('network', models.SmallIntegerField()),
                ('agentrate', models.CharField(max_length=255)),
                ('userrate', models.CharField(max_length=255)),
                ('vendorrate', models.CharField(max_length=255)),
                ('price', models.CharField(max_length=255)),
                ('name', models.CharField(max_length=255)),
            ],
            options={
                'db_table': 'crypto',
            },
        ),
        migrations.CreateModel(
            name='DataPin',
            fields=[
                ('dpId', models.IntegerField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=255)),
                ('price', models.CharField(max_length=255)),
                ('userprice', models.CharField(max_length=255)),
                ('agentprice', models.CharField(max_length=255)),
                ('vendorprice', models.CharField(max_length=255)),
                ('planid', models.CharField(max_length=255)),
                ('atype', models.CharField(blank=True, max_length=255, null=True)),
                ('datanetwork', models.SmallIntegerField()),
                ('day', models.CharField(max_length=255)),
            ],
            options={
                'db_table': 'datapins',
            },
        ),
        migrations.CreateModel(
            name='DataPlan',
            fields=[
                ('pId', models.IntegerField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=255)),
                ('price', models.CharField(max_length=255)),
                ('userprice', models.CharField(max_length=255)),
                ('agentprice', models.CharField(max_length=255)),
                ('vendorprice', models.CharField(max_length=255)),
                ('planid', models.CharField(max_length=255)),
                ('atype', models.CharField(blank=True, max_length=255, null=True)),
                ('datanetwork', models.SmallIntegerField()),
                ('day', models.CharField(max_length=255)),
            ],
            options={
                'db_table': 'dataplans',
            },
        ),
        migrations.CreateModel(
            name='DataToken',
            fields=[
                ('tId', models.IntegerField(primary_key=True, serialize=False)),
                ('sId', models.IntegerField()),
                ('tRef', models.CharField(max_length=255)),
                ('business', models.CharField(max_length=30)),
                ('network', models.CharField(max_length=30)),
                ('datasize', models.CharField(max_length=30)),
                ('quantity', models.IntegerField()),
                ('serial', models.TextField()),
                ('tokens', models.TextField()),
                ('date', models.DateTimeField(auto_now_add=True)),
            ],
            options={
                'db_table': 'datatokens',
            },
        ),
        migrations.CreateModel(
            name='ElectricityID',
            fields=[
                ('eId', models.IntegerField(primary_key=True, serialize=False)),
                ('electricityid', models.CharField(blank=True, max_length=50, null=True)),
                ('provider', models.CharField(max_length=50)),
                ('abbreviation', models.CharField(max_length=5)),
                ('providerStatus', models.CharField(default='On', max_length=10)),
            ],
            options={
                'db_table': 'electricityid',
            },
        ),
        migrations.CreateModel(
            name='ExamID',
            fields=[
                ('eId', models.IntegerField(primary_key=True, serialize=False)),
                ('examid', models.CharField(blank=True, max_length=10, null=True)),
                ('provider', models.CharField(max_length=50)),
                ('price', models.IntegerField(default=0)),
                ('buying_price', models.IntegerField(default=0)),
                ('providerStatus', models.CharField(default='On', max_length=10)),
            ],
            options={
                'db_table': 'examid',
            },
        ),
        migrations.CreateModel(
            name='NetworkID',
            fields=[
                ('nId', models.IntegerField(primary_key=True, serialize=False)),
                ('networkid', models.CharField(max_length=10)),
                ('smeId', models.CharField(max_length=10)),
                ('giftingId', models.CharField(max_length=10)),
                ('corporateId', models.CharField(max_length=10)),
                ('vtuId', models.CharField(max_length=10)),
                ('sharesellId', models.CharField(max_length=10)),
                ('network', models.CharField(max_length=20)),
                ('networkStatus', models.CharField(default='Off', max_length=10)),
                ('vtuStatus', models.CharField(default='Off', max_length=10)),
                ('sharesellStatus', models.CharField(default='Off', max_length=10)),
                ('airtimepinStatus', models.CharField(default='Off', max_length=10)),
                ('smeStatus', models.CharField(default='Off', max_length=10)),
                ('giftingStatus', models.CharField(default='Off', max_length=10)),
                ('corporateStatus', models.CharField(default='Off', max_length=10)),
                ('datapinStatus', models.CharField(default='Off', max_length=10)),
            ],
            options={
                'db_table': 'networkid',
            },
        ),
        migrations.CreateModel(
            name='Account',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('account_number', models.CharField(max_length=20, unique=True)),
                ('account_name', models.CharField(max_length=100)),
                ('bank_name', models.CharField(max_length=100)),
                ('balance', models.DecimalField(decimal_places=2, default=0.0, max_digits=12)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='accounts', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'account',
            },
        ),
    ]
