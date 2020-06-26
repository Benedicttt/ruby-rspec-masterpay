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
      callbackUrl: "https://webhook.site/1f1e9b6b-059f-4bad-8460-cc9032d9e58a"
      # card - if exists, then this type payments => payment_pay
    }
  }
end

def delete_from_header(kwargs)
  params_for_payments.tap { |hs| hs[:header].delete(kwargs) }
end

def delete_from_payload(param)
  params_for_payments.tap { |hs| hs[:payload].delete(param) }
end

def add_param_to_header(param)
  params_for_payments.tap { |hs| hs[:header].merge!(param) }
end

def add_param_to_payload(param)
  params_for_payments.tap { |hs| hs[:payload].merge!(param) }
end