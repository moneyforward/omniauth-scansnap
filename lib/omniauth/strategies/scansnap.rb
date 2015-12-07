require 'omniauth-oauth2'

OmniAuth.config.add_camelization('scansnap', 'ScanSnap')

module OmniAuth
  module Strategies
    class ScanSnap < OmniAuth::Strategies::OAuth2
      MAX_STATE_LENGTH = 36

      option :authorize_options, %i(state)

      def setup_phase
        options[:client_options].merge!(
          site: site,
          authorize_url: '/oauth2/authorize',
          token_url: '/api/oauth2/token'
        )

        options[:token_params][:headers] = { 'Authorization' => authorization }

        options[:state] = SecureRandom.hex(MAX_STATE_LENGTH / 2)
      end

      uid do
        access_token.params['user_id']
      end

      def site
        country = options.delete(:country)
        language = options.delete(:language)
        locale = language ? "#{language}_#{country}" : country
        region_api_uri = options.delete(:region_api_uri) || "https://api.cloud.scansnap.com/api/region/"

        response = Faraday.get("#{region_api_uri}#{locale}")
        body = JSON.parse(response.body)
        body['auth_url']
      end

      def authorization
        raw = "#{options[:client_id]}:#{options[:client_secret]}"
        encoded = Base64.strict_encode64(raw)
        "Basic #{encoded}"
      end
    end
  end
end
