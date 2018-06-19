ENV["ELASTICSEARCH_URL"] = "https://search-in-the-monaco-kitchen-hog3n323ovglhuyra3ogmnuss4.us-east-1.es.amazonaws.com"

if File.exists?("config/elasticsearch.yml")
   config = YAML.load_file("config/elasticsearch.yml")[Rails.env].symbolize_keys
   Elasticsearch::Model.client = Elasticsearch::Client.new(config)
end

