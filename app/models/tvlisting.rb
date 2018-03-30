class Tvlisting < ApplicationRecord
  
  
  validates :title, presence: true, length: { maximum: 255 }
  validates :user_id, presence: true
  
  belongs_to :user
  
  has_many :tvshows
end
