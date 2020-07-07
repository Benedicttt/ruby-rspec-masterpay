class Schema
  # @return [Dry::Schema::JSON]
  def payments_get_403

    Dry::Schema.JSON do
      required(:success).filled(:bool).value(eql?: false)
      required(:result).filled(:integer).value(eql?: 1)
      required(:status).filled(:integer).value(eql?: 403)
      required(:errors).maybe do
        array do
          hash do
            required(:code).filled(:string)
            required(:kind).filled(:string)
          end
        end
      end
    end
  end
end