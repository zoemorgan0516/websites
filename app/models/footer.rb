class Footer
  include Mongoid::Document
  include Mongoid::Timestamps


  # 公司logo
  mount_uploader :avatar, AvatarUploader, default: 1
  validates :avatar,      :presence => true
  # 电话、地址
  field :company_number,       type: String, default: 1
  validates :company_number,   :presence => true

  field :company_address,      type: String, default: 1
  validates :company_address,  :presence => true

  belongs_to :site

end
