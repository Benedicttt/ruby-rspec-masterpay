require 'hash_dot'

describe 'MasterPay', :host_to_host, feature: 'Host to host, Payments Get' do

  describe 'positive response: send params and true auth private key' do
    include_examples :list_param, "2016-05-09", 4, :response_payment_get

    # How set name variable response, so we call it
    let(:token_last_payments) { response_payment_get_to_dot.payments.last.token }
    let!(:response) { call_payments_get "get transaction 1", token_last_payments }

    it { expect(response.code).to eq 200 }

    it 'schema' do
      sym_param = symbolize response.body
      errors = Schema.new.payments_get_200.call(sym_param).errors.to_h

      Schema.new.check errors, response, params
    end
  end
end
