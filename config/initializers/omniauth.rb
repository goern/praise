Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '587786671260237', '58f9b2bfe8ba7e931c2482e85af344dc',
    :scope => 'publish_stream,email,offline_access,manage_pages,user_birthday,read_stream'
end
