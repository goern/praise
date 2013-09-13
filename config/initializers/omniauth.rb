Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
    :scope => 'publish_stream,email,offline_access,manage_pages,user_birthday,read_stream'
end