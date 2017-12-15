class Footer
  include Mongoid::Document
  include Mongoid::Timestamps


  # 公司logo
  mount_uploader :avatar, AvatarUploader
  #validates :avatar,      :presence => true
  # 电话、地址
  field :company_number,       type: String
  #validates :company_number,   :presence => true
  field :company_address,      type: String
  #validates :company_address,  :presence => true

  belongs_to :site

end
