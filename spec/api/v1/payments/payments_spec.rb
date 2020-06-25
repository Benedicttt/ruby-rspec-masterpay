describe 'MasterPay', feature: 'send post request of response api' do

  describe 'positive response: send params and true auth private key' do
    let(:response) { call_payments('positive response', params_for_payments) }

    it 'response 200' do
      expect(response.code).to eq 200
    end

    it 'schema' do
      sym_param = symbolize(response.body)
      errors = Schema.new.payments_200.call(sym_param).errors.to_h
      Schema.new.check(errors, response)
    end
  end

  describe 'negative response: send empty params and auth private key' do
    let(:response) { call_payments('negative response', {}) }

    it 'response 403' do
      expect(response.code).to eq 403
    end

    it 'schema' do
      sym_param = symbolize(response.body)
      errors = Schema.new.payments_403_hash.call(sym_param).errors.to_h
      Schema.new.check(errors, response)
    end
  end

  describe 'negative response: send params without amount' do
    let(:response) { call_payments('positive response 2', params_for_payments.tap { |hs| hs[:payload].delete(:amount) }) }
    let(:response_strict) { OpenStruct.new symbolize response.body }

    it 'response 403' do
      expect(response.code).to eq 403
    end

    it 'schema' do
      sym_param = symbolize(response.body)
      errors = Schema.new.payments_403_array.call(sym_param).errors.to_h
      Schema.new.check(errors, response)
    end

    it 'params error, index 0' do
      error = OpenStruct.new response_strict.errors[0]

      expect(error.code).to eq 'amount_blank_or_invalid'
      expect(error.kind).to eq 'invalid_request_error'
    end

    it 'params error, index 1' do
      error = OpenStruct.new response_strict.errors[1]

      expect(error.code).to eq 'amount_less_1_cent'
      expect(error.kind).to eq 'processing_error'
    end
  end

  describe 'negative response: send params without currency' do
    let(:response) { call_payments('positive response 3', params_for_payments.tap { |hs| hs[:payload].delete(:currency) }) }
    let(:response_strict) { OpenStruct.new symbolize response.body }
    let(:params) { params_for_payments.delete(:currency) }


    it 'response 200' do
      expect(response.code).to eq 403
    end

    it 'schema' do
      sym_param = symbolize(response.body)
      errors = Schema.new.payments_403_array.call(sym_param).errors.to_h
      Schema.new.check(errors, response)
    end

    it 'params error, index 0' do
      error = OpenStruct.new response_strict.errors[0]

      expect(error.code).to eq '_currency_is_not_converted'
      expect(error.kind).to eq 'invalid_request_error'
    end

    it 'params error, index 1' do
      error = OpenStruct.new response_strict.errors[1]

      expect(error.code).to eq 'currency_blank_or_invalid'
      expect(error.kind).to eq 'invalid_request_error'
    end
  end
end
