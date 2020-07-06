class Schema
  def payments_list_200

    Dry::Schema.JSON do
      required(:success).filled(:bool).value(eql?: true)
      required(:result).filled(:integer).value(eql?: 0)
      required(:totalCount).filled(:integer)
      required(:curentPage).filled(:integer)
      required(:perPage).filled(:integer)
      required(:totalPage).filled(:integer)

      required(:payments).array do
        hash do
          required(:id).filled(:integer)
          required(:status).filled(:string)
          required(:token).filled(:string)
          required(:currency).filled(:string)
          required(:product).filled(:string)
          required(:callback_url).maybe(:string)
          required(:redirect_success_url).maybe(:string)
          required(:redirect_fail_url).maybe(:string)
          required(:amount).filled(:integer)
          required(:created_at).filled(:string)
          required(:updated_at).filled(:string)
          required(:extra_return_param).filled(:string)
          required(:operation_type).filled(:string)
          required(:order_number).filled(:string)
        end
      end
    end
  end
end

