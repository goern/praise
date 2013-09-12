class CanvasController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :index
  before_filter :detect_facebook_post!

  after_filter :allow_iframe

  layout :set_layout

  def index
    if not get_session[:user_id].blank?
      @user = User.find(get_session[:user_id])
    end
      
    @lobs = Lob.all
  end
  
  def new_lob
    @users = User.all
  end



  def get_session
    if has_session_in_header?
      logger.info "Reading session from header"
      return @header_session if @header_session
      encrypted_session = request.headers['X-Session']
      secret = FBCanvasRails::Application.config.secret_token
      verifier = ActiveSupport::MessageVerifier.new(secret, 'SHA1')
      @header_session = verifier.verify(encrypted_session).with_indifferent_access
    else
      logger.info "Reading session from cookies"
      session
    end
  end

  private
  # Change layout if request was CJAX
  def set_layout
    if request.headers['X-CJAX']
      logger.info "CJAX request received."
      "cjax"
    else
      logger.info "Regular, non-CJAX request received."
      "canvas"
    end
  end

  # Session present in request header (for CJAX requests)
  def has_session_in_header?
    !!(request.headers['X-Session'])
  end

  # https://coderwall.com/p/toddiq
  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end
end
