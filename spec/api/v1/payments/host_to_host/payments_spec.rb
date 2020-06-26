describe 'MasterPay', :host_to_host, feature: 'Host to host' do

  describe 'positive response: send params and true auth private key' do
    let(:params) { add_param_to_payload(params_for_card) }
    let(:response) { call_payments 'positive response Host to host 1', params }

    it do
      expect(response.code).to eq 200
    end

    it 'schema' do
      sym_param = symbolize response.body
      errors = Schema.new.payments_host_to_host_200.call(sym_param).errors.to_h
      Schema.new.check errors, response, params
    end
  end

  # describe 'negative response: send empty params and auth private key' do
  #   let(:response) { call_payments 'negative response', {}  }
  #
  #   it 'response 403' do
  #     expect(response.code).to eq 403
  #   end
  #
  #   it 'schema' do
  #     sym_param = symbolize response.body
  #     errors = Schema.new.payments_403_hash.call(sym_param).errors.to_h
  #     Schema.new.check errors, response
  #   end
  # end
  #
  # describe 'negative response: send params without amount' do
  #   let(:response) { call_payments 'positive response 2', delete_from_payload(:amount) }
  #   let(:response_strict) { OpenStruct.new symbolize response.body }
  #
  #   it 'response 403' do
  #     expect(response.code).to eq 403
  #   end
  #
  #   it 'schema' do
  #     sym_param = symbolize response.body
  #     errors = Schema.new.payments_403_array.call(sym_param).errors.to_h
  #     Schema.new.check errors, response
  #   end
  #
  #   it 'params error, index 0' do
  #     error = OpenStruct.new response_strict.errors[0]
  #
  #     expect(error.code).to eq 'amount_blank_or_invalid'
  #     expect(error.kind).to eq 'invalid_request_error'
  #   end
  #
  #   it 'params error, index 1' do
  #     error = OpenStruct.new response_strict.errors[1]
  #
  #     expect(error.code).to eq 'amount_less_1_cent'
  #     expect(error.kind).to eq 'processing_error'
  #   end
  # end
  #
  # describe 'negative response: send params without currency' do
  #   let(:response) { call_payments 'positive response 3', delete_from_payload(:currency) }
  #   let(:response_strict) { OpenStruct.new symbolize response.body }
  #
  #   it 'response 403' do
  #     expect(response.code).to eq 403
  #   end
  #
  #   it 'schema' do
  #     sym_param = symbolize response.body
  #     errors = Schema.new.payments_403_array.call(sym_param).errors.to_h
  #     Schema.new.check errors, response
  #   end
  #
  #   it 'params error, index 0' do
  #     error = OpenStruct.new response_strict.errors[0]
  #
  #     expect(error.code).to eq '_currency_is_not_converted'
  #     expect(error.kind).to eq 'invalid_request_error'
  #   end
  #
  #   it 'params error, index 1' do
  #     error = OpenStruct.new response_strict.errors[1]
  #
  #     expect(error.code).to eq 'currency_blank_or_invalid'
  #     expect(error.kind).to eq 'invalid_request_error'
  #   end
  # end
end
