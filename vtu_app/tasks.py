from celery import shared_task
import requests
from django.contrib.auth import get_user_model
from vtu_app.models import *
from decimal import Decimal
from django.db import transaction

User = get_user_model()

@shared_task
def process_data_purchase(transaction_id,
                          user_id,
                          network,
                          data_plan,
                          phone,
                          bypass,
                          request_id,
                          amount_to_pay):
    # Get the API key                              
    api_key = ApiConfig.objects.get(name='data_api')
    try:
        url = 'https://n3tdata.com/api/data'
        payload = {
            'network': network,
            'phone': phone,
            'data_plan': data_plan,
            'bypass': bypass,
            'request-id': request_id
        }
        headers = {
            'Authorization': f'Token {api_key}',
            'Content-Type': 'application/json'
        }

        response = requests.post(url, json=payload, headers=headers)
        res = response.json()

        # Retrieve user and transaction
        txn = Transactions.objects.get(transaction_id=transaction_id)
        user = User.objects.get(username=user_id)

        if res.get('status') == 'success':
            with transaction.atomic():
                # Deduct balance only if API is successful
                user.balance -= Decimal(amount_to_pay)
                user.save()

                # Update transaction status
                txn.status = 'completed'
                txn.api_return_message = res
                txn.save()


        else:
            # If API fails, mark transaction as failed (balance unchanged)
            txn.status = 'failed'
            txn.api_return_message = res
            txn.save()
            
    except Exception as e:
        txn = Transactions.objects.get(transaction_id=transaction_id)
        txn.status = 'failed'
        txn.api_return_message = str(e)
        txn.save()
