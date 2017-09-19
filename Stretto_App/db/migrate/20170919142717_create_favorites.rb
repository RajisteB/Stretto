class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.integer :festival_id
      t.integer :user_id
      t.string :name
      t.string :venue
      t.string :location
      t.string :datetime
      
      t.timestamps
    end
  end
end
