class Footer
  include Mongoid::Document
  include Mongoid::Timestamps

  # 公司logo
  field :footer_logo,          type: String
  validates :footer_logo,      :presence => true
  # 电话、地址、版权等
  field :company_number,       type: String
  validates :company_number,   :presence => true

  field :company_address,      type: String
  validates :company_address,  :presence => true

  field :site_copyright,       type: String
  validates :site_copyright,   :presence => true

  belongs_to :site

end
