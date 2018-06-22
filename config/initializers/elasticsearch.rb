require 'faraday_middleware'
require 'faraday_middleware/aws_sigv4'

conn = Faraday.new(url: 'https://search-in-the-monaco-kitchen-hog3n323ovglhuyra3ogmnuss4.us-east-1.es.amazonaws.com') do | faraday |
  faraday.request :aws_sigv4,
    service: 'es',
    region: 'us-east-1',
    access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
  # see http://docs.aws.amazon.com/sdk-for-ruby/v3/api/Aws/Sigv4/Signer.html

  faraday.adapter Faraday.default_adapter
end

# faraday_config = lambda do |faraday|
#   faraday.request :aws_sigv4, {
#     credentials: Aws::Credentials.new(
#       ENV["AWS_ACCESS_KEY_ID"],
#       ENV["AWS_SECRET_ACCESS_KEY"]
#       ),
#       service_name: "es",
#       region: 'us-east-1'
#     }
#     faraday.adapter :typhoeus
#   end

# elasticsearch_host_config = {
#   host:   ENV["ELASTICSEARCH_HOST"],
#   port:   ENV["ELASTICSEARCH_PORT"],
#   scheme: ENV["ELASTICSEARCH_SCHEME"]
# }

# transport = Elasticsearch::Transport::Transport::HTTP::Faraday.new(hosts: [elasticsearch_host_config], &faraday_config)

# client = Elasticsearch::Client.new(transport: transport)
