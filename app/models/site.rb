class Site
  include Mongoid::Document
  include Mongoid::Timestamps

  paginates_per 5
  # 站点logo
  mount_uploader :avatar,        AvatarUploader
  # 站点域名
  field :domain,               type: String
  validates :domain, presence: true
  # 站点名字
  field :name,              type: String
  #validates :name, presence: true


  # 关联关系
  has_one :user

  has_one   :footer
  accepts_nested_attributes_for :footer

  has_many :categories
  has_many :emails
  has_many :contents_classes
  has_many :photos
  has_many :slider_pictures
  has_many :cooperations
  has_many :articles

end
