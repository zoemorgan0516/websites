class UrlAddress
  include Mongoid::Document

  # 站点域名
  field :site_url,               type: String
  validates :site_url, presence: true

  # 关联关系
  has_one :user
end
