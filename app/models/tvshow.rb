class Tvshow < ApplicationRecord
  
  before_save :show_length_to_int
  
  belongs_to :user
  
  validates :user_id, presence: true
  validates :showtitle, presence: true, length: { maximum: 255 }
  
  private
  
  def show_length_to_int
    
    row_data = self.show_length
    
    int = 
    (row_data.time.hour * 3600) + 
    (row_data.time.min * 60) + 
    row_data.time.sec
    
    self.show_length_int = int
    
  end
  
  
  
end
