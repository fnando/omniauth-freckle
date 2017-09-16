# Omniauth::Freckle

[![Travis-CI](https://travis-ci.org/fnando/omniauth-freckle.png)](https://travis-ci.org/fnando/omniauth-freckle)
[![CodeClimate](https://codeclimate.com/github/fnando/omniauth-freckle.png)](https://codeclimate.com/github/fnando/omniauth-freckle)
[![Test Coverage](https://codeclimate.com/github/fnando/omniauth-freckle/badges/coverage.svg)](https://codeclimate.com/github/fnando/omniauth-freckle/coverage)
[![Gem](https://img.shields.io/gem/v/omniauth-freckle.svg)](https://rubygems.org/gems/omniauth-freckle)
[![Gem](https://img.shields.io/gem/dt/omniauth-freckle.svg)](https://rubygems.org/gems/omniauth-freckle)

[Freckle](http://letsfreckle.com) OAuth2 Strategy for OmniAuth.

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-freckle'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-freckle

## Usage

`OmniAuth::Strategies::Freckle` is simply a Rack middleware. Read the OmniAuth docs for detailed instructions: <https://github.com/intridea/omniauth>.

First, create a new application at `https://<your subdomain>.letsfreckle.com/time/integrations/freckle_api`. Your callback URL must be something like `https://example.com/auth/freckle/callback`. For development you can use `http://127.0.0.1:3000/auth/freckle/callback`.

Here's a quick example, adding the middleware to a Rails app in `config/initializers/omniauth.rb`. This example assumes you're exporting your credentials as environment variables.

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :freckle, ENV['FRECKLE_CLIENT_ID'], ENV['FRECKLE_CLIENT_SECRET']
end
```

Now visit `/auth/freckle` to start authentication against Freckle.

## Contributing

1. Fork it ( https://github.com/fnando/omniauth-freckle/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
