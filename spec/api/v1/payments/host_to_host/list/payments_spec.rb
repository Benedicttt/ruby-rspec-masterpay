describe 'MasterPay', :host_to_host, feature: 'Host to host' do

  describe 'positive response: send params and true auth private key' do
    let(:params) { add_param_to_payload params_for_card }
    let(:response) { call_payments_list 'positive response Host to host 1', params }

    it do
      expect(response.code).to eq 200
    end

    it 'schema' do
      sym_param = symbolize response.body
      errors = Schema.new.payments_list_200.call(sym_param).errors.to_h

      Schema.new.check errors, response, params
    end
  end

end
