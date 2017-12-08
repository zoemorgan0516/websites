class Site
  include Mongoid::Document
  include Mongoid::Timestamps

  # 站点名字
  field :site_name,              type: String
  validates :site_name, presence: true
  # 站点域名
  field :site_url,               type: String
  validates :site_url, presence: true

  # 关联关系
  belongs_to :user
  has_one    :navbar

end
