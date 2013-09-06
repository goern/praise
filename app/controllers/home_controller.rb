class HomeController < ApplicationController
  def index
    @lobs = Lob.all
  end
end
