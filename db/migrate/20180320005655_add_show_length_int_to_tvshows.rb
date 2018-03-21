class AddShowLengthIntToTvshows < ActiveRecord::Migration[5.1]
  def change
    add_column :tvshows, :show_length_int, :integer
  end
end
