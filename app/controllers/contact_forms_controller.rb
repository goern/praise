class ContactFormsController < ApplicationController
  include Rack::Recaptcha::Helpers
  
  def new
    @contact_form = ContactForm.new
  end

  def create
    begin
      @contact_form = ContactForm.new(params[:contact_form])
      if recaptcha_valid?
        @contact_form.request = request
        if @contact_form.deliver
          flash.now[:notice] = 'Thank you for your message!'
        else
          render :new
        end
      else
        flash.now[:error] = 'That capchta was not good!'
        render :new
      end
    rescue ScriptError
      flash[:error] = 'Sorry, this message appears to be spam and was not delivered.'
    end
  end
end
