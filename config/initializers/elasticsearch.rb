require 'faraday_middleware-aws-sigv4'

# ELASTICSEARCH_URL = ENV["ELASTICSEARCH_URL"] || 'http://localhost:9200'

# Elasticsearch::Model.client = Elasticsearch::Client.new(host: ELASTICSEARCH_URL)

Searchkick.client = Elasticsearch::Client.new(url: ENV['ELASTICSEARCH_URL']) do |f|
  f.request :aws_signers_v4,
            credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']),
            service_name: 'es',
            region: 'us-east-1'
  f.adapter Faraday.default_adapter
end