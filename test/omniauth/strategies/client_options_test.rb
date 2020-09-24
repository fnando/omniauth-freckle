# frozen_string_literal: true

require "test_helper"

class ClientOptionsTest < Minitest::Test
  let(:app) { ->(env) { } }

  let(:strategy) do
    OmniAuth::Strategies::Freckle.new(app, "consumer_id", "consumer_secret")
  end

  test "sets name" do
    assert_equal "freckle", strategy.options.name
  end

  test "sets authorize url" do
    assert_equal "https://secure.letsfreckle.com/oauth/2/authorize",
                 strategy.options.client_options.authorize_url
  end

  test "sets token url" do
    assert_equal "https://secure.letsfreckle.com/oauth/2/access_token",
                 strategy.options.client_options.token_url
  end

  test "sets site url" do
    assert_equal "https://api.letsfreckle.com",
                 strategy.options.client_options.site
  end
end
