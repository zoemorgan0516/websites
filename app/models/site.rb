class Site
  include Mongoid::Document
  include Mongoid::Timestamps

  paginates_per 5
  # 站点logo
  mount_uploader :avatar,        AvatarUploader
  # 站点管理员姓名
  field :site_manager,           type: String
  # 站点管理员邮箱
  field :site_manager_email,     type: String
  # 版权等
  field :site_copyright,         type: String
  # 站点名字
  field :name,              type: String
  #validates :name, presence: true
  # 站点域名
  field :domain,               type: String
  validates :domain, presence: true

  # 关联关系
  has_one :user

  has_one   :footer
  accepts_nested_attributes_for :footer

  has_many :categories
  has_many :contents
  has_many :cooperations
  has_many :slider_pictures
  has_many :advantages

end
