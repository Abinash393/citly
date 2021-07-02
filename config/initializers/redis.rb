Redis.current = Redis.new(
  url:  Rails.application.credentials[:redis][:REDIS_URL],
  port: Rails.application.credentials[:redis][:REDIS_PORT],
  db:   Rails.application.credentials[:redis][:REDIS_DB]
)