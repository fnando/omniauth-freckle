require "omniauth"
require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class Freckle < OmniAuth::Strategies::OAuth2
      option :client_options, {
        authorize_url: "https://secure.letsfreckle.com/oauth/2/authorize",
        token_url: "https://secure.letsfreckle.com/oauth/2/access_token",
        site: "https://api.letsfreckle.com"
      }

      uid do
        info.fetch(:id)
      end

      info do
        @info ||= deep_symbolize(access_token.get("/v2/current_user").parsed)
      end

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end
