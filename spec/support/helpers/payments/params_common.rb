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
