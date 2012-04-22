# encoding: utf-8
class UserMailer < ActionMailer::Base
  def contact(contact)
    @contact = contact
    mail({
     to: "rehactive@gmail.com" ,
     subject: @contact.name + " zkontaktował się z tobą ze strony www.rehactivce.com",
     from: @contact.email,
     reply_to: @contact.email
    })
  end
end

