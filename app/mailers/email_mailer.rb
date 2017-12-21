class EmailMailer < ApplicationMailer
  def notify_email_placed(email)
    @email       = email
    @user        = email.user

    mail(to: @user.email , subject: "[Site] 感谢您的反馈，以下是您这次发送邮件的具体内容 #{email.id}")
  end
end
