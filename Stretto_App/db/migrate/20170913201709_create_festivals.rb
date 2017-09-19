class CreateFestivals < ActiveRecord::Migration[5.1]
  def change
    create_table :festivals do |t|
      t.string :name
      t.string :location
      t.string :picture_url
      t.string :date_time
      t.string :tickets_url
      
      t.timestamps
    end
  end
end
