class HomeController < ApplicationController
  def index
    logger.debug "g=#{$graph}"
    
    @lobs = Lob.all
  end
end
