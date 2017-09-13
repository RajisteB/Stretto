class CreateFestivals < ActiveRecord::Migration[5.1]
  def change
    create_table :festivals do |t|

      t.timestamps
    end
  end
end
