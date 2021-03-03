class Upvote < ApplicationRecord
  belongs_to :chirp

  validates :chirp, presence: true
  validates :ip, presence: true, uniqueness: { scope: :chirp }
end
