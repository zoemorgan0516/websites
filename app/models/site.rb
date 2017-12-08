class Site
  include Mongoid::Document
  include Mongoid::Timestamps
  # 网站名字
  field :name,              type: String

  # 关联关系
  belongs_to :user
  
end
