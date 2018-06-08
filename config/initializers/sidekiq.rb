# See https://hackernoon.com/how-to-setup-and-deploy-a-rails-5-app-on-aws-beanstalk-with-postgresql-redis-and-more-88a38355f1ea
rails_root = Rails.root || File.dirname(__FILE__) + '/../..'
rails_env = Rails.env || 'development'
redis_config = YAML.load_file(rails_root.to_s + '/config/redis.yml')
redis_config.merge! redis_config.fetch(Rails.env, {})
redis_config.symbolize_keys!
# Sidekiq.configure_server do |config|
#  config.redis = { url: "redis://#{redis_config[:host]}:#{redis_config[:port]}/12" }
# end
# Sidekiq.configure_client do |config|
#  config.redis = { url: "redis://#{redis_config[:host]}:#{redis_config[:port]}/12" }
# end
Sidekiq.configure_server do |config|
 config.redis = { host: "#{redis_config[:host]}", port: "#{redis_config[:port]}", db: 12 }
end
Sidekiq.configure_client do |config|
 config.redis = { host: "#{redis_config[:host]}", port: "#{redis_config[:port]}", db: 12 }
end