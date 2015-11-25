# OmniAuth::ScanSnap

OmniAuth OAuth2 Strategy for ScanSnap

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-scansnap'
```

And then execute:

    $ bundle

## Usage

```
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :scansnap, ENV['SCANSNAP_CLIENT_ID'], ENV['SCANSNAP_CLIENT_SECRET'], country: 'JP', language: 'ja'
end
```

## Options

List of options you can pass to provider

| Option | Required? | Explanation |
|:-------|:---------:|:------------|
| country | YES | ISO 3166-1 alpha-2 code of a country for which you want to retrieve api/authentication endpoint. (e.g. 'jp' for Japan) ||
| language | NO | ISO 639-1 code of a language for which you want to retrieve api/authentication endpint. (e.g. 'JP' for Japanese) ||
| region_api_uri | NO | API endpoint uri to retrieve local api/authentication endpoint urls. You don't need to pass this option unless you have special need to overwrite default uri. |

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
