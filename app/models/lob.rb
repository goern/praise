class Lob < ActiveRecord::Base
  validates :description, presence: true
  
  scope :since, lambda {|time| where("created_at > ?", time) }
  scope :during_last, lambda {|time| where("created_at > ?", (Time.now - time)) }

  def author
    name = Rails.cache.read('fb_me_name')
    if name.nil?
      name = $graph.get_object('me')['name']
      Rails.cache.write('fb_me_name', name)
    else
      name = Rails.cache.read('fb_me_name')
    end
    name
  end
  
  def user
    name = Rails.cache.read(user_fb_id)
    if name.nil?
      name = $graph.get_object(user_fb_id)['name']
      Rails.cache.write(user_fb_id, name)
    else
      name = Rails.cache.read(user_fb_id)
    end
    name
  end

end