class Category
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Orderable


  # 建立分类的菜单属性，即每个分类可以拉出一个菜单
  field :menu,      type: String
  field :menu_url,  type: String

  belongs_to :site

  #在site中增加一个位置的属性
  orderable scope: :site, column: :position

end
