# ENV["ELASTICSEARCH_URL"] = "https://search-in-the-kitchen-7viustmbj6cwtqamywrdvvrmx4.us-east-1.es.amazonaws.com"

Elasticsearch::Model.client = Elasticsearch::Client.new({
  log: true 
})

Searchkick.aws_credentials = {
  access_key_id: ENV["AWS_ACCESS_KEY_ID"],
  secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
  region: "us-east-1"
}