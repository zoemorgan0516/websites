class Navbar
  include Mongoid::Document
  include Mongoid::Timestamps

  # 站点logo
  field :site_logo,       type: String
  validates :site_logo,   :presence => true
  # 站点右侧菜单
  field :site_menu1,      type: String
  validates :site_menu1,  :presence => true

  field :site_menu2,      type: String
  validates :site_menu2,  :presence => true

  field :site_menu3,      type: String
  validates :site_menu3,  :presence => true

  field :site_menu4,      type: String
  validates :site_menu4,  :presence => true

  belongs_to :site

end
