class CreateUserLocations < ActiveRecord::Migration
  def change
    create_table :user_locations do |t|
      t.integer :user_id
      t.integer :location_id

      t.timestamps null: false
    end
    add_index :user_locations, [:user_id, :location_id]
  end
end
