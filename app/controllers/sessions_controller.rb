class SessionsController < ApplicationController

  def new
    redirect_to '/auth/facebook'
  end


  def create
    auth = request.env["omniauth.auth"]
    token = auth['credentials']['token']
    user = User.where(:provider => auth['provider'], 
                      :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)

    $graph = Koala::Facebook::API.new(token)

#    logger.debug "a=#{auth}, t=#{token}, u=#{user}, g=#{$graph}"
    
# Reset the session after successful login, per
# 2.8 Session Fixation – Countermeasures:
# http://guides.rubyonrails.org/security.html#session-fixation-countermeasures
    reset_session
    session[:user_id] = user.id
    session[:fb_access_token] = token
    session[:fb_user_id] = auth['uid']
    user.add_role :admin if User.count == 1 # make the first user an admin
    if user.email.blank?
      redirect_to edit_user_path(user), :alert => I18n.t("Please enter your email address.")
    else
      redirect_to root_url, :notice => I18n.t('Signed in!')
    end

  end

  def destroy
    reset_session
    $graph = nil
    
    redirect_to root_url, :notice => I18n.t('Signed out!')
  end

  def failure
    redirect_to root_url, :alert => I18n.t("Authentication error: #{params[:message].humanize}")
  end

end
