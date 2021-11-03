require 'async'
require 'async/http/internet'
require 'open-uri'

puts "Ruby #{RUBY_VERSION}"

def run_uri_open
  start = Time.now

  Async do |task|
    task.async do
      URI.open("https://httpbin.org/delay/1.6")
    end

    task.async do
      URI.open("https://httpbin.org/delay/1.6")
    end
  end

  puts "URI.open duration: #{Time.now - start}"
end

def run_async_http
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

  puts "Async::HTTP duration: #{Time.now - start}"
end

run_uri_open
run_async_http
