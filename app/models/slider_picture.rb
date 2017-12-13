class SliderPicture
  include Mongoid::Document
  include Mongoid::Timestamps
  # 图片上的内容
  field :content,              type: String
  # 图片
  field :avatar, type: String
  mount_uploader :avatar,        AvatarUploader
  # 关联关系
  belongs_to :site
end
