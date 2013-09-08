class ContactForm < MailForm::Base
  attributes :name,  :validate => true
  attributes :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attributes :message
  
  append :remote_ip, :user_agent, :session

  def headers
    {
       :subject => "haste-gut-gemacht: we have a contact",
       :to => "goern@b4mad.net",
       :from => %("#{name}" <#{email}>)
     }
  end
end