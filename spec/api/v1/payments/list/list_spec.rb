require 'hash_dot'

describe 'MasterPay', :host_to_host, feature: 'Host to host, Payments List' do

  describe 'positive response: send params and true auth private key' do
    include_examples :list_param, nil, 4, :response

    it { expect(response.code).to eq 200 }

    it 'schema' do
      sym_param = symbolize response.body
      errors = Schema.new.payments_list_200.call(sym_param).errors.to_h

      Schema.new.check errors, response, params
    end
  end

  describe 'positive response: send params_for_list (day, per-page, page) and true auth private key' do
    include_examples :list_param, Time.now.strftime("%Y-%d-%m"), 4, :response

    it { expect(response.code).to eq 200 }

    it 'schema' do
      sym_param = symbolize response.body
      errors = Schema.new.payments_list_200.call(sym_param).errors.to_h

      Schema.new.check errors, response, params
    end
  end

  describe 'positive response: send params_for_list (day minus 4 years, per-page, page) and true auth private key' do
    include_examples :list_param, "2016-05-09", 3, :response

    it { expect(response.code).to eq 200 }
    it { expect(response_to_dot.payments.count).to eq 20 }

    it 'schema' do
      sym_param = symbolize response.body
      errors = Schema.new.payments_list_200.call(sym_param).errors.to_h

      Schema.new.check errors, response, params
    end
  end
end
