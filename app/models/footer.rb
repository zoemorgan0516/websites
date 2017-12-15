class Footer
  include Mongoid::Document
  include Mongoid::Timestamps


  # 公司logo
  mount_uploader :avatar, AvatarUploader
  #validates :avatar,      :presence => true
  # 电话、地址
  field :company_number,       type: String
<<<<<<< HEAD
  # validates :company_number,   :presence => true
=======
  #validates :company_number,   :presence => true
>>>>>>> 72c19b873e5575a1c2db38a8b53d194bd1fd5c94
  field :company_address,      type: String
  #validates :company_address,  :presence => true

  belongs_to :site

end
