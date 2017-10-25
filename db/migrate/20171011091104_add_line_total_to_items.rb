class AddLineTotalToItems < ActiveRecord::Migration
  def change
    add_column :items, :line_total, :float
  end
end
