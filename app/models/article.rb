class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  #文章标题
  field :title, type: String
  validates_presence_of :title, message: "标题不能为空"

  # 文章内容
  field :content, type: String

  # 文章来源
  field :from, type: String

  # 来源地址
  field :url, type: String

  # 图片
  mount_uploader :avatar, AvatarUploader

  # 关联关系
  belongs_to :user
end
