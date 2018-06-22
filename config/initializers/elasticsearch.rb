# require 'faraday_middleware-aws-sigv4'

# ELASTICSEARCH_URL = ENV["ELASTICSEARCH_URL"] || 'http://localhost:9200'

# Elasticsearch::Model.client = Elasticsearch::Client.new(host: ELASTICSEARCH_URL)

# Searchkick.client = Elasticsearch::Client.new(url: ENV['ELASTICSEARCH_URL']) do |f|
#   f.request :aws_signers_v4,
#             credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']),
#             service_name: 'es',
#             region: 'us-east-1'
#   f.adapter Faraday.default_adapter
# end

require 'faraday_middleware/aws_signers_v4'

transport_configuration = lambda do |f|
  f.request :aws_signers_v4,
    credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']),
    service_name: 'es',
    region: 'us-east-1'
  
  f.response :logger
  f.adapter Faraday.default_adapter
end

transport = Elasticsearch::Transport::Transport::HTTP::Faraday.new \
  hosts: [{ scheme: 'https', host: ENV['ELASTICSEARCH_URL'], port: '443' }],
  &transport_configuration

Elasticsearch::Model.client = Elasticsearch::Client.new transport: transport