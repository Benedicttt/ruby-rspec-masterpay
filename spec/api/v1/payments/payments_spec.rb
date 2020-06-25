describe 'MasterPay', feature: 'send post request of payments api' do
  describe 'response' do
    let(:payments) { call_payments('payments') }

    it 'check result 403' do
      expect(payments.code).to eq 403
    end

    it 'check schema' do
      sym_param = symbolize(payments.body)
      errors = Schema.new.payments_403.call(sym_param).errors.to_h
      Schema.new.check(errors, payments)
    end
  end
end