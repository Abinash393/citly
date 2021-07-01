class Link < ApplicationRecord
  
    validates :original_url, presence: true, length: { maximum: 512 }

    before_create :generate_short_url

    def generate_short_url
      self.short_url = SecureRandom.uuid.split('-')[0]
    end
end
