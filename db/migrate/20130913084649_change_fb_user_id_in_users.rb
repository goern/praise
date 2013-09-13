class ChangeFbUserIdInUsers < ActiveRecord::Migration
  def change
    change_column :users, :fb_user_uid, :integer, :limit => 8
  end
end
