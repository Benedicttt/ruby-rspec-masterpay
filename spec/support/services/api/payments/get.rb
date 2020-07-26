module Services
  module API
    module V1
      class PaymentsGet
        def call(token)
          url = ENV['BASE_URL'] + ENV['PAYMENTS'] + "/" + token
          # puts "Host: " + url

          RestClient::Request.execute(
            method: :get,
            url: url,
            headers: common_header
          ) { |response| response }
        end

      end
    end
  end
end