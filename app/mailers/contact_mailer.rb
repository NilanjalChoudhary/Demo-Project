class ContactMailer < ApplicationMailer
  def send_contact_email(contact)
    @contact = contact 
    mail(to: 'hr@preciousinfosytem.com', subject: "Message from NonPreciousian")
  end  
end