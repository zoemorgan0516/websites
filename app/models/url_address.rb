class UrlAddress
  include Mongoid::Document
  include Mongoid::Timestamps
  # 站点域名
  field :site_url,               type: String
  validates :site_url, presence: true
end
