class HomeController < ApplicationController
  def index
    if $graph.nil?
      logger.info "$graph is nil"
      
      $graph = Koala::Facebook::API.new
    end
    
    logger.debug "g=#{$graph}"
    
    @lobs = Lob.all
  end
end
