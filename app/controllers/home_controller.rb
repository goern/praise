class HomeController < ApplicationController
  def index
    $graph = Koala::Facebook::API.new(session[:fb_access_token]) unless $graph.nil?
    
    @lobs = Lob.all
  end
end
