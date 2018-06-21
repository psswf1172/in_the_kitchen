ELASTICSEARCH_URL = ENV["ELASTICSEARCH_URL"] || 'http://localhost:9200'

# config = {
#   transport_options: { request: { timeout: 5 } }
# }

# if File.exists?("config/elasticsearch.yml")
#   template = ERB.new(File.new("config/elasticsearch.yml").read)
#   processed = YAML.load(template.result(binding))
#   config.merge!(processed[Rails.env])
# end

Elasticsearch::Model.client = Elasticsearch::Client.new(host: ELASTICSEARCH_URL)
