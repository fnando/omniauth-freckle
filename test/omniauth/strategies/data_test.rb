# frozen_string_literal: true

require "test_helper"

class DataTest < Minitest::Test
  let(:app) { ->(env) { } }

  let(:strategy) do
    OmniAuth::Strategies::Freckle.new(app, "consumer_id", "consumer_secret")
  end

  test "returns uid" do
    strategy.stubs(:info).returns({id: "ID"})
    assert_equal "ID", strategy.uid
  end

  test "returns info" do
    response = mock("response", parsed: {
                      "id" => "ID",
                      "name" => "NAME"
                    })
    access_token = mock("access_token")
    access_token.expects(:get).with("/v2/current_user").returns(response)
    strategy.stubs(:access_token).returns(access_token)

    info = strategy.info

    assert_equal "ID", info[:id]
    assert_equal "NAME", info[:name]
  end
end
