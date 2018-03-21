module TvshowsHelper
  
  def int_to_dow(dow)
    dow_list = ["月", "火", "水", "木", "金", "土", "日", ]
    
    dow_list[dow]
    
  end
  
  def show_length_to_int(show_length)
    
    show_length_int = 
    (show_length.time.hour * 3600) + 
    (how_length.time.min * 60) + 
    show_length.time.sec
    
    
  end
  
  
  
end
