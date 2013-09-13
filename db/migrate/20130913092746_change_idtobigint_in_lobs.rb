class ChangeIdtobigintInLobs < ActiveRecord::Migration
  def change
    change_column :lobs, :author_fb_id, :integer, :limit => 8
    change_column :lobs, :user_fb_id, :integer, :limit => 8
  end
end
