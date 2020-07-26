module Services
  module API
    module V1
      class DefaultGetResponse

        # @param [Object] params
        def call(url)
          RestClient::Request.execute(
            method: :get,
            url: url
          ) { |response| response }
        end

      end
    end
  end
end