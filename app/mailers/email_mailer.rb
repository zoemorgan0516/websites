class EmailMailer < ApplicationMailer
  def notify_email_placed(email)
    @email       = email
    @consumer    = email.email_address

    mail(to: @consumer , subject: "#{email.site.domain} 感谢您的反馈，我们已经收到您的反馈！")
  end

  def notify_email_placed_to_admin(email)
    @email       = email
    @admin       = email.site.user.email

    mail(to: @admin , subject: "#{email.site.domain} 收到用户的反馈，请点开邮件查看详细内容！")
  end
end
