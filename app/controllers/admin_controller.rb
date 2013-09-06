class AdminController < ApplicationController
  def index
    @number_of_users = User.count
    @number_of_lobs = Lob.count
  end
end
