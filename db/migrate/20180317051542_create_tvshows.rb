class CreateTvshows < ActiveRecord::Migration[5.1]
  def change
    create_table :tvshows do |t|
      t.string :showtitle
      t.references :user, foreign_key: true
      t.time :show_length
      t.integer :dow
      t.time :show_start_time

      t.timestamps
    end
  end
end
