class CreateLobs < ActiveRecord::Migration
  def change
    create_table :lobs do |t|
      t.integer :author_fb_id # author says about
      t.integer :user_fb_id   # user, that he
      t.text :description     # was good at this

      t.timestamps
    end
  end
end
