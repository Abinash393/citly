class CsvGeneratorJob < ApplicationJob
  include Sidekiq::Status::Worker
  
  sidekiq_options queue: :default, retry: 3
  queue_as :default

  def expiration
    @expiration ||= 60 * 60 # 1 Hour
  end

  def perform(*args)
    links = Link.all
    csv = []
    # column
    csv << ["Original URL", "Short URL", "Visitors"]
    links.each do |link|
      csv << [link.original_url, link.short_url, link.counter]
    end
    redis.sadd(uuid, csv)
    puts "-" * 10, uuid
  end

end
