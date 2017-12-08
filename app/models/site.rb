class Site
  include Mongoid::Document
  include Mongoid::Timestamps
  # 网站名字
  field :site_name,              type: String
  # 网站域名
  field :site_url,               type: String

  # 关联关系
  belongs_to :user

end
