describe 'MasterPay', :host_to_host, feature: 'Host to host, Initialize payments' do

  describe 'positive response: send params and true auth private key' do
    let(:params) { add_param_to_payload params_for_card }
    let(:response) { call_payments_create secure_random, params }

    it { expect(response.code).to eq 200 }

    it 'schema' do
      sym_param = symbolize response.body
      errors = Schema.new.payments_host_to_host_200.call(sym_param).errors.to_h

      Schema.new.check errors, response, params
    end
  end

  describe 'negative response: send empty params and auth private key' do
    let(:params) { {} }
    let(:response) { call_payments_create secure_random, {}  }

    it('response 403') { expect(response.code).to eq 403 }

    it 'schema' do
      sym_param = symbolize response.body
      errors = Schema.new.payments_403_hash.call(sym_param).errors.to_h

      Schema.new.check errors, response, params
    end
  end

  describe 'negative response: send params without amount' do
    let(:params) { {} }
    let(:response) { call_payments_create secure_random, delete_from_payload(:amount) }
    let(:response_strict) { OpenStruct.new symbolize response.body }

    it('response 403') { expect(response.code).to eq 403 }

    it 'schema' do
      sym_param = symbolize response.body
      errors = Schema.new.payments_403_array.call(sym_param).errors.to_h
      Schema.new.check errors, response, params
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
    let(:params) { {} }
    let(:response) { call_payments_create secure_random, delete_from_payload(:currency) }
    let(:response_strict) { OpenStruct.new symbolize response.body }

    it('response 403') { expect(response.code).to eq 403 }

    it 'schema' do
      sym_param = symbolize response.body
      errors = Schema.new.payments_403_array.call(sym_param).errors.to_h
      Schema.new.check errors, response, params
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

  describe 'positive response: send params and true auth private key' do
    let(:params) { add_param_to_payload params_for_card }
    let(:response) { call_payments_create secure_random, params }

    it { expect(response.code).to eq 200 }

    it 'schema' do
      sym_param = symbolize response.body
      errors = Schema.new.payments_host_to_host_200.call(sym_param).errors.to_h

      Schema.new.check errors, response, params
    end
  end
end
