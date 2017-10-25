class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name, unique: true
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
