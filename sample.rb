require_relative 'lib/atproto'
require 'io/console'

username = ARGV[0] || (print "Enter username: "; STDIN.gets.chomp)
app_password = ARGV[1] || (print "Enter app password (input is hidden): "; STDIN.noecho(&:gets).chomp)

client = ATProto::Client.new("https://bsky.social")
if client.login(username, app_password)
  puts "Login successful!"
  puts "Access token: #{client.access_token}"
else
  puts "Login failed."
end

# Refresh token when needed
if client.refresh_session
  puts "Token refreshed!"
  puts "New access token: #{client.access_token}"
else
  puts "Failed to refresh token."
end
