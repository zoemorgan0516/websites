class Site
  include Mongoid::Document
  include Mongoid::Timestamps
  # 站点管理员姓名
  field :site_manager,               type: String
  # 站点管理员邮箱
  field :site_manager_email,               type: String
  # 站点名字
  field :site_name,              type: String
  # 站点域名
  field :site_url,               type: String

  # 关联关系
  belongs_to :user

end
