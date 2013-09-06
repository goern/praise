class Lob < ActiveRecord::Base
  belongs_to :user
  belongs_to :author, :class_name => 'User', foreign_key: "author_id"

  validates :user, presence: true
  validates :author, presence: true
  validates :description, presence: true
  
  scope :since, lambda {|time| where("created_at > ?", time) }
  scope :during_last, lambda {|time| where("created_at > ?", (Time.now - time)) }
end