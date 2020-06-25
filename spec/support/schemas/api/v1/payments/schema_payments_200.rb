class Schema
  # @return [Dry::Schema::JSON]
  def payments_200

    Dry::Schema.JSON do
      required(:success).filled(:bool).value(eql?: true)
      required(:result).filled(:integer).value(eql?: 0)
      required(:status).filled(:integer).value(eql?: 200)
      required(:token).filled(:string).value(max_size?: 32)
      required(:processingUrl).filled(:string)

      required(:payment).hash do
        required(:amount).filled(:integer).value(eql?: 1000)
        required(:gateway_amount).filled(:integer).value(eql?: 1000)
        required(:currency).filled(:string).value(max_size?: 3)
        required(:currency).filled(:string).value(eql?: 'CNY')
        required(:status).filled(:string).value(eql?: 'init')
      end
    end

  end
end
