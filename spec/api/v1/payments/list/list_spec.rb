describe 'MasterPay', :host_to_host, feature: 'Host to host, Payments List' do
  describe 'positive response: set nil date but setting in shared example block date Time now' do
    include_examples :list_param, nil, 1, :response

    it { expect(response.code).to eq 200 }

    it 'schema' do
      sym_param = symbolize response.body
      errors = Schema.new.payments_list_200.call(sym_param).errors.to_h

      Schema.new.check errors, response, params
    end
  end

  describe 'positive response: set date Time now' do
    include_examples :list_param, Time.now.strftime('%Y-%m-%d'), 5, :response

    it { expect(response.code).to eq 200 }

    it 'schema' do
      sym_param = symbolize response.body
      errors = Schema.new.payments_list_200.call(sym_param).errors.to_h

      Schema.new.check errors, response, params
    end
  end

  describe 'positive response: set true date ' do
    include_examples :list_param, '2016-05-09', 2, :response

    it { expect(response.code).to eq 200 }
    it { expect(response_to_dot.payments.count).to eq 20 }

    it 'schema' do
      sym_param = symbolize response.body
      errors = Schema.new.payments_list_200.call(sym_param).errors.to_h

      Schema.new.check errors, response, params
    end
  end

  describe 'negative response: set failed date, but will return 200' do
    let(:params) do
      params_for_payments_list.merge(
        payload: {
          date_from: (Time.now + 100.years).strftime('%Y-%m-%d'),
          date_to: (Time.now + 100.years).strftime('%Y-%m-%d')
        }
      )
    end

    let(:response_to_dot) { JSON.parse(response.body).to_dot }
    let(:response) do
      call_payments_create 'create list 1', params
      call_payments_list 'create list 2', params
    end

    it { expect(response.code).to eq 200 }
    it { expect(response_to_dot.payments.count).to eq 0 }

    it 'schema' do
      sym_param = symbolize response.body
      errors = Schema.new.payments_list_200.call(sym_param).errors.to_h

      Schema.new.check errors, response, params
    end
  end
end
