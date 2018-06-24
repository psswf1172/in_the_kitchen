# require 'faraday/middleware'
# require 'faraday_middleware/aws_sigv4'

ENV["ELASTICSEARCH_URL"] || "localhost:9200"

Searchkick.aws_credentials = {
  access_key_id: ENV["AWS_ACCESS_KEY_ID"], 
  secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
  service: "es",
  region: "us-east-1"
}