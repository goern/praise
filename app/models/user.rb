class User < ActiveRecord::Base
  rolify

  validates_presence_of :name

  has_many :lobs

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.fb_access_token = auth['token']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
      end
    end
  end
  
  def update_token(auth)
    logger.info "facebook token updated for #{self}"
    self.fb_access_token = auth['token']
    self.save
  end

end
