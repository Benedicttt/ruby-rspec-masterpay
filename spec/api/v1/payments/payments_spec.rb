describe 'MasterPay', feature: 'send post request of payments api' do
  describe 'positive response' do
    let(:payments) { call_payments('positive response payment', params) }
    let(:params) do
      {
        header: { Authorization: ENV['MERCHANT_PRIVATE_KEY'] },
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

    it 'check result 200' do
      expect(payments.code).to eq 200
    end

    it 'check schema' do
      sym_param = symbolize(payments.body)
      errors = Schema.new.payments_200.call(sym_param).errors.to_h
      Schema.new.check(errors, payments)
    end
  end

  describe 'negative response' do
    let(:params) { {} }
    let(:payments) { call_payments('negative response payment', params) }

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




