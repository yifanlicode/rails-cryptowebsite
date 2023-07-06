class AddUserToWatchlists < ActiveRecord::Migration[7.0]
  def change
    change_column :watchlists, :user_id, :bigint, null: false, foreign_key: true
  end
end
