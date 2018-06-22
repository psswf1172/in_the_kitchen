# ELASTICSEARCH_URL = ENV["ELASTICSEARCH_URL"] || 'http://localhost:9200'

# Elasticsearch::Model.client = Elasticsearch::Client.new(host: ELASTICSEARCH_URL)

require 'faraday_middleware'
require 'faraday_middleware/aws_sigv4'
require 'pp'

conn = Faraday.new(url: 'https://search-in-the-monaco-kitchen-hog3n323ovglhuyra3ogmnuss4.us-east-1.es.amazonaws.com') do |faraday|
  faraday.request :aws_sigv4,
    service: 'apigateway',
    region: 'us-east-1',
    access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
  # see http://docs.aws.amazon.com/sdk-for-ruby/v3/api/Aws/Sigv4/Signer.html

  faraday.response :json, content_type: /\bjson\b/
  faraday.response :raise_error

  faraday.adapter Faraday.default_adapter
end

# res = conn.get '/'