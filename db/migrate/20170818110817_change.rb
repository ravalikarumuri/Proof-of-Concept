class Change < ActiveRecord::Migration
  def change
    rename_column :users, :user_id, :manager_id
  end
end
