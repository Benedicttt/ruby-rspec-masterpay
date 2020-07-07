require 'hash_dot'

describe 'MasterPay', :host_to_host, feature: 'Host to host, Payments Get' do

  describe 'positive response: send params true token' do
    # Get payments list
    include_examples :list_param, "2016-05-09", 4, :response_payment_get

    # How set name variable response, so we call it
    let(:token_last_payments) { response_payment_get_to_dot.payments.last.token }
    let!(:response) { call_payments_get secure_random, token_last_payments }

    it { expect(response.code).to eq 200 }

    it 'schema' do
      sym_param = symbolize response.body
      errors = Schema.new.payments_get_200.call(sym_param).errors.to_h

      Schema.new.check errors, response, params
    end
  end

  describe 'negative response: send params false token' do
    # Get payments list
    include_examples :list_param, "2016-05-09", 4, :response_payment_get

    # How set name variable response, so we call it
    let(:token_last_payments) { response_payment_get_to_dot.payments.last.token + 1.to_s }
    let!(:response) { call_payments_get secure_random, token_last_payments }
    let!(:response_to_dot) { JSON.parse(response.body).to_dot }

    it { expect(response.code).to eq 403 }

    it 'schema' do
      sym_param = symbolize response.body
      errors = Schema.new.payments_get_403.call(sym_param).errors.to_h

      Schema.new.check errors, response, params
    end

    it 'params error' do
      expect(response_to_dot.errors[0].code).to eq 'payment_or_merchant_not_found'
      expect(response_to_dot.errors[0].kind).to eq 'invalid_request_error'
    end
  end
end
