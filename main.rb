require 'async'
require 'async/http/internet'
require 'open-uri'

puts "RUBY #{RUBY_VERSION}"

def run_uri_open
  puts 'URI::OPEN'

  start = Time.now

  Async do |task|
    task.async do
      URI.open("https://httpbin.org/delay/1.6")
    end

    task.async do
      URI.open("https://httpbin.org/delay/1.6")
    end
  end

  puts "Duration: #{Time.now - start}"
end

def run_async_http
  puts 'ASYNC-HTTP'

  start = Time.now

  Async do |task|
    http_client = Async::HTTP::Internet.new

    task.async do
      http_client.get('https://httpbin.org/delay/1.6')
    end

    task.async do
      http_client.get('https://httpbin.org/delay/1.6')
    end
  end

  puts "Duration: #{Time.now - start}"
end

run_uri_open
run_async_http
