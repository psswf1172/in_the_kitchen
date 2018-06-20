# ENV["ELASTICSEARCH_URL"] = "https://search-in-the-monaco-kitchen-hog3n323ovglhuyra3ogmnuss4.us-east-1.es.amazonaws.com"

config = {
  transport_options: { request: { timeout: 5 } }
}

if File.exists?("config/elasticsearch.yml")
  template = ERB.new(File.new("config/elasticsearch.yml").read)
  processed = YAML.load(template.result(binding))
  config.merge!(processed[Rails.env].symbolize_keys)
end

Elasticsearch::Model.client = Elasticsearch::Client.new(config)
