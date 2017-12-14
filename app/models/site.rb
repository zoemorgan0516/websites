class Site
  include Mongoid::Document
  include Mongoid::Timestamps

  # 站点logo
  mount_uploader :avatar,        AvatarUploader
  # 站点名字
  field :site_name,              type: String
  #validates :site_name, presence: true
  # 站点域名
  field :site_url,               type: String
  validates :site_url, presence: true
  # 站点管理员姓名
  field :site_manager,           type: String
  # 站点管理员邮箱
  field :site_manager_email,     type: String
  # 版权等
  field :site_copyright,         type: String

  # 关联关系
  belongs_to :user

  has_one   :footer
  accepts_nested_attributes_for :footer

  has_many :categories
  has_many :contents
  has_many :cooperations
  has_many :slider_pictures
  has_many :advantages

end
