class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user?, :except => [:index]
  before_filter :admin_user?, :only => :destroy
    
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def show
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.visible = false
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:visible)
    end
end
