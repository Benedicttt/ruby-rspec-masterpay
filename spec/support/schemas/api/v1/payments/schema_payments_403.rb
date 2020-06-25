class Schema
  # @return [Dry::Schema::JSON]
  def payments_403

    Dry::Schema.JSON do
      required(:success).filled(:bool).value(eql?: false)
      required(:result).filled(:integer).value(eql?: 1)
      required(:status).filled(:integer).value(eql?: 403)
      required(:errors).hash do
        required(:list).array do
          hash do
            required(:code).filled(:string).value(eql?: "auth_header_not_found")
            required(:kind).filled(:string).value(eql?: "authentication_error")
          end
        end
      end
    end
    
  end
end