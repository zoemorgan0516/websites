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
  # 站点slider配图文字
  field :slider_string1,            type: String
  field :slider_string2,            type: String
  field :slider_string3,            type: String
  # 站点advantage配图文字
  field :advantage_string1,            type: String
  field :advantage_string2,            type: String
  field :advantage_string3,            type: String
  field :advantage_string4,            type: String
  field :advantage_string5,            type: String
  field :advantage_string6,            type: String
  # 站点advantage配链接
  field :advantage_url1,            type: String
  field :advantage_url2,            type: String
  field :advantage_url3,            type: String
  field :advantage_url4,            type: String
  field :advantage_url5,            type: String
  field :advantage_url6,            type: String

  # 站点cooperation配图文字
  field :cooperation_string,            type: String

  field :domain,               type: String
  validates :domain, presence: true


  # 关联关系
  has_one :user

  has_one   :footer
  accepts_nested_attributes_for :footer

  has_many :categories

  has_many :emails
  has_many :contents_classes
  has_many :photos
  has_many :advantage_pics
  has_many :cooperation_pics

end
