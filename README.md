# atproto-ruby

A Ruby library for interacting with the AT Protocol, providing easy-to-use methods for authentication and API requests to Bluesky's ATProto-based services.

## Description

This library simplifies the process of integrating ATProto authentication and API interactions into Ruby and Ruby on Rails applications. It provides a straightforward interface for logging in, refreshing tokens, and (in the future) performing other actions supported by the AT Protocol.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'atproto'
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install atproto
```

## Usage

### Basic Login

```ruby
require 'atproto'

client = ATProto::Client.new("https://bsky.social")
if client.login("your_username", "your_app_password")
  puts "Login successful!"
  # Perform actions after successful login
else
  puts "Login failed."
end
```

### Token Refresh

```ruby
if client.refresh_session
  puts "Token refreshed!"
  # Use the refreshed token for subsequent API calls
else
  puts "Failed to refresh token."
end
```

Replace `"your_username"` and `"your_app_password"` with the actual username and app password.

## Contributing

Contributions are welcome and greatly appreciated! Here are some ways you can contribute:

- Reporting bugs
- Suggesting enhancements
- Submitting pull requests

## License

This project is licensed under the MIT License.

## Acknowledgments

- AT Protocol and Bluesky community for providing the specifications and documentation.