class Email
  include Mongoid::Document
  include Mongoid::Timestamps

  paginates_per 5

  # 发送邮件者姓名
  field :name,           type: String
  # 发送邮件者联系邮箱
  field :email_address,     type: String
  # 发送邮件内容
  field :content,         type: String



  # 关联关系
  belongs_to :site

end
