# @return [Hash]
def params_for_payments
  {
    header: { Authorization: merchant_private_key },
    payload: {
      product: 'Your Product',
      amount: 1000,
      currency: 'CNY',
      redirectSuccessUrl: 'https://your-site.com/success',
      redirectFailUrl: 'https://your-site.com/fail',
      extraReturnParam: 'your order id or other info',
      orderNumber: 'your order number',
      locale: 'en'
    }
  }
end