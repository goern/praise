class SessionsController < ApplicationController

  def new
    redirect_to '/auth/facebook'
  end

# FIXME http://stackoverflow.com/questions/10249778/facebook-token-expiration-and-renewal-with-koala-and-omniauth-facebook

  def create
    auth = request.env["omniauth.auth"]
    token = auth['credentials']['token']
    user = User.where(:provider => auth['provider'], 
                      :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)
    
    user.fb_user_uid = auth['uid']
    user.fb_access_token = token
    user.save
    
# Reset the session after successful login, per
# 2.8 Session Fixation – Countermeasures:
# http://guides.rubyonrails.org/security.html#session-fixation-countermeasures
    reset_session
    session[:user_id] = user.id
    session[:fb_access_token] = token
    user.add_role :admin if user.uid == 1066967336 # goern
    user.add_role :admin if user.uid == 999 # hild FIXME
    
    if user.email.blank?
      redirect_to edit_user_path(user), :alert => I18n.t("Please enter your email address.")
    else
      redirect_to root_url, :notice => I18n.t('Signed in!')
    end

  end

  def destroy
    reset_session
    redirect_to root_url, :notice => I18n.t('Signed out!')
  end

  def failure
    redirect_to root_url, :alert => I18n.t("Authentication error: #{params[:message].humanize}")
  end

end
