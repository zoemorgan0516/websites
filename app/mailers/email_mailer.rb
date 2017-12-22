class EmailMailer < ApplicationMailer
  def notify_email_placed(email)
    @email       = email
    @consumer    = email.email_address

    mail(to: @consumer , subject: "#{email.site.domain} 感谢您的反馈，我们已经收到您的反馈！)
  end
end
