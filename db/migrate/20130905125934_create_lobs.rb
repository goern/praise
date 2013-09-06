class CreateLobs < ActiveRecord::Migration
  def change
    create_table :lobs do |t|
      t.text :description
      t.boolean :published

      t.belongs_to :user, index: true
      t.belongs_to :author, :class_name => 'User', index: true

      t.timestamps
    end
  end
end
