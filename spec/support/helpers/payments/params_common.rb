# @return [Hash]
def params_for_payments
  {
    header: { Authorization: merchant_private_key },
    payload: {
      amount: ENV['AMOUNT'],
      currency: ENV['CURRENCY'],
      product: 'Your Product',
      redirectSuccessUrl: 'http://localhost:9292/add/callbacks',
      redirectFailUrl: 'http://localhost:9292/add/callbacks',
      extraReturnParam: 'your order id or other info',
      orderNumber: 'your order number',
      locale: 'en',
      callbackUrl: 'http://localhost:9292/add/callbacks',
      customer: { email: 'aburyka@wirecapital.com' }
    }
  }
end

def params_for_payments_list
  {
    header: { Authorization: merchant_private_key },
    payload: {
      date_from: Time.now.strftime('%Y-%d-%m'),
      page: 1,
      per_page: 1
    }
  }
end

def common_header
  { Authorization: merchant_private_key }
end