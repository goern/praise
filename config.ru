# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
use Rack::Deflater
use Rack::ContentLength

# DOC https://github.com/gamesthatgive/rack-facebook-signed-request/issues/1
use Rack::Facebook::SignedRequest,
	:app_id => "587786671260237",
	:secret => "58f9b2bfe8ba7e931c2482e85af344dc" #,
#	:inject_facebook => true # FIXME every second reload of page causes an internal server error

run Rails.application
