def merchant_private_key
  ENV['MERCHANT_PRIVATE_KEY']
end

def current_currency
  ENV['CURRENCY']
end

def current_amount
  ENV['AMOUNT']
end

def current_card
  ENV['CURRENT_CARD']
end

def holder
  ENV['HOLDER']
end

def cvv
  ENV['CVV']
end

def expires
  ENV['EXPIRES']
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

def add_param_to_payload_refunds(param)
  params_for_payments_refunds.tap { |hs| hs[:payload].merge!(param) }
end

def secure_random
  SecureRandom.hex(200)
end