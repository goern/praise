class Lob < ActiveRecord::Base
  validates :description, presence: true
  
  scope :since, lambda {|time| where("created_at > ?", time) }
  scope :during_last, lambda {|time| where("created_at > ?", (Time.now - time)) }

  def author
    if $graph.nil?
      logger.error "$graph is still nil! ALERT"
    else
      name = Rails.cache.read('fb_me_name')
      if name.nil?
        # seeAlso http://benbiddington.wordpress.com/2010/04/23/facebook-graph-api-getting-access-tokens/
        begin
          name = $graph.get_object('me')['name'] # FIXME me is not avail at this point where we dont have a (API auth'd with a) token
          Rails.cache.write('fb_me_name', name)
        rescue OAuthException => e
          name ="<unset>"
        end
      else
        name = Rails.cache.read('fb_me_name')
      end
    end
    
    name
  end
  
  def user
    if $graph.nil?
      logger.error "$graph is nil! ALERT"
    else
      name = Rails.cache.read(user_fb_id)
      if name.nil?
        name = $graph.get_object(user_fb_id)['name']
        Rails.cache.write(user_fb_id, name)
      else
        name = Rails.cache.read(user_fb_id)
      end
    end
    
    name
  end

end