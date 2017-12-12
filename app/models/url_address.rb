class UrlAddress
  include Mongoid::Document

  # 站点域名
  field :site_url,               type: String
  validates :site_url, presence: true

  # 关联关系
  belongs_to :user
end
