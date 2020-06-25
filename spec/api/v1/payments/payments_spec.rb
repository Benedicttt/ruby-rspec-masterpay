describe 'MasterPay', feature: 'send post request of payments api' do
  describe 'response' do
    let(:payments) { call_payments('payments') }
    # let(:payments) { Services::API::V1::Payments.new.call }


    it 'check result 403' do
      expect(payments.code).to eq 403
    end

    it 'check result 403' do
      expect(payments.code).to eq 403
    end
  end
end