module Sinatra
  module MemcachedCommand
    def run options
      host = options[:host]
      port = options[:port]
      command = options[:command]

      memcached_connection = Net::Telnet::new("Host" => host, "Port" => port, "Timeout" => 3)
      memcached_connection.cmd("String" => command, "Match" => /^END/) do |response|
        return response
      end
    end
  end
end