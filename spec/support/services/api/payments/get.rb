module Services
  module API
    module V1
      class PaymentsGet
        def call(token)
          RestClient::Request.execute(
            method: :get,
            url: ENV['BASE_URL'] + ENV['PAYMENTS'] + "/" + token,
            headers: common_header
          ) { |response| response }
        end

      end
    end
  end
end