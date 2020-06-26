# @return [Hash]
def params_for_payments
  {
    header: { Authorization: merchant_private_key },
    payload: {
      amount: ENV['AMOUNT'],
      currency: ENV['CURRENCY'],
      product: 'Your Product',
      redirectSuccessUrl: 'https://your-site.com/success',
      redirectFailUrl: 'https://your-site.com/fail',
      extraReturnParam: 'your order id or other info',
      orderNumber: 'your order number',
      locale: 'en',
      callbackUrl: 'https://webhook.site/1f1e9b6b-059f-4bad-8460-cc9032d9e58a',
      customer: { email: 'aburyka@wirecapital.com' }
    }
  }
end
