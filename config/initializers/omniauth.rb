# seeAlso http://stackoverflow.com/questions/4532721/facebook-development-in-localhost

if Rails.env == 'development' || Rails.env == 'test'
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '587786671260237', '58f9b2bfe8ba7e931c2482e85af344dc',
      :scope => 'publish_stream,email,offline_access,manage_pages,user_birthday,read_stream'
  end
else
  # Production
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '514621748615493', '820a9aee790f08260dc6e9b654b16195',
      :scope => 'publish_stream,email,offline_access,manage_pages,user_birthday,read_stream'
  end
end