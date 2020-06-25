module Services
  module API
    module V1
      class Payments

        def call(params)
          params = OpenStruct.new(params)
          header = params.header.nil? ? header_default : params.header.merge(header_default)
          payload = params.payload.nil? ? {} : params.payload

          RestClient::Request.execute(
            method: :post,
            url: ENV['BASE_URL'] + ENV['PAYMENTS'],
            headers: header,
            payload: payload
          ) { |response| response }
        end

      end
    end
  end
end