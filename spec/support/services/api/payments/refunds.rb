module Services
  module API
    module V1
      class PaymentsRefunds

        # @param [Object] params
        def call(params)
          header = params.dig(:header).nil? ? header_default : params.dig(:header).merge(header_default)
          payload = params.dig(:payload).nil? ? {} : params.dig(:payload)
          url = ENV['BASE_URL'] + ENV['REFUNDS']
          puts header
          puts payload
          puts 'Host: ' + url

          RestClient::Request.execute(
            method: :post,
            url: url,
            headers: header,
            payload: payload
          ) { |response| response }
        end

      end
    end
  end
end