describe 'MasterPay', :host_to_host, feature: 'Payments Refunds' do
  describe 'positive response: add token and amount 100 to params' do
    let(:params_card) { add_param_to_payload params_for_card }
    let(:create_pay) { JSON.parse((call_payments_create 'create for refunds 1', params_card).body) }

    let(:processing_url) { create_pay.dig('processingUrl') }

    let(:token) { create_pay.dig('token') }
    let(:get_payment_response_before) { call_payments_get("call get payments before", token) }
    let(:get_payment_response_after) { call_payments_get("call get payments after", token) }

    let(:token_from_get_payment) { JSON.parse(get_payment_response_before.body).dig('payment', 'token') }
    let(:param_refunds) { add_param_to_payload_refunds(token: token_from_get_payment) }

    let(:action_click_approve_to_browser) { Actions.new.click_approve_to_browser(processing_url) }
    let(:response) { call_payments_refunds('call refunds 2', param_refunds) }

    it do
      puts 'Create'
      puts create_pay
      puts
    end

    it do
      puts 'Get payment'
      puts get_payment_response_before
      puts
    end

    it do
      puts 'Approve from browser and Get payment'
      action_click_approve_to_browser
      puts get_payment_response_after
      puts
    end

    it do
      puts 'Refunds'
      puts param_refunds
      puts response.body
    end

  end
end
