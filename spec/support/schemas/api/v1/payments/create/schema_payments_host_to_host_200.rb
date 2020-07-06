class Schema
  def payments_host_to_host_200

    Dry::Schema.JSON do
      required(:success).filled(:bool).value(eql?: true)
      required(:result).filled(:integer).value(eql?: 0)
      required(:status).filled(:integer).value(eql?: 200)
      required(:token).filled(:string).value(max_size?: 32)
      required(:processingUrl).filled(:string)

      required(:payment).hash do
        required(:amount).filled(:integer).value(eql?: current_amount.to_i)
        required(:gateway_amount).filled(:integer).value(eql?: current_amount.to_i)
        required(:currency).filled(:string).value(max_size?: 3)
        required(:currency).filled(:string).value(eql?: current_currency)
        required(:status).filled(:string).value(eql?: "init")
      end

      required(:redirectRequest).hash do
        required(:url).filled(:string).value(eql?: "https://demo.develop.gate.securemasterpay.com/demo/3ds")

        required(:params).hash do
          required(:PaReq).filled(:string).value(eql?: "TEST_PAREQ_SUCCESS")
          required(:TermUrl).filled(:string)
          required(:MD).filled(:string).value(max_size?: 32)
        end

        required(:type).filled(:string).value(eql?: "post")
      end
    end
  end
end
