Redis.current = Redis.new(
  url:  Rails.application.credentials[:redis][:url],
  port: Rails.application.credentials[:redis][:port],
  db:   Rails.application.credentials[:redis][:db]
)