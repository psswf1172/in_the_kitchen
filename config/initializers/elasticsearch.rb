require 'faraday/middleware'
require 'faraday_middleware/aws_sigv4'

Searchkick.client =
  Elasticsearch::Client.new(
    url: ENV["ELASTICSEARCH_URL"],
    transport_options: {request: {timeout: 10}}
  ) do |f|
    f.use FaradayMiddleware::Gzip
    f.request :aws_sigv4, {
      credentials: Aws::Credentials.new(ENV["AWS_ACCESS_KEY_ID"], ENV["AWS_SECRET_ACCESS_KEY"]),
      service: "es",
      region: "us-east-1"
    }
  end