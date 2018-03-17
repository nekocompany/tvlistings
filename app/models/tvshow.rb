class Tvshow < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :showtitle, presence: true, length: { maximum: 255 }
  
end
