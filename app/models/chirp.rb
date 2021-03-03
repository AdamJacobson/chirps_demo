class Chirp < ApplicationRecord
  has_many :upvotes

  validates :message, presence: true, length: { maximum: 140 }

  def upvote_count
    upvotes.size
  end

  def already_upvoted?(ip)
    Upvote.find_by(chirp: self, ip: ip).present?
  end
end
