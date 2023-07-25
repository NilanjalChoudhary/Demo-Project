class MyMailer < ApplicationMailer
  default from: 'your_email@example.com'

  def approval_notification(user)
      @user = user
      mail(to: @user.email, subject: 'Your Account Has Been Approved')
  end
end
