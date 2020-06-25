module Services
  module API
    module V1
      class Payments
        def call
          params = {}

          RestClient::Request.execute(
            method: :post,
            url: ENV['BASE_URL'] + ENV['PAYMENTS'],
            headers: header_empty.merge(:'Content-Type' => "application/json"),
            payload: params
          ) { |response| response }
        end
      end
    end
  end
end