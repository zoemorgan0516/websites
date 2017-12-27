class SliderPicture
  include Mongoid::Document
  include Mongoid::Timestamps

  # 滑动图片
  mount_uploader :avatar,            AvatarUploader
  # 滑动图片文字
  field :content,                    type: String
  # 滑动图片链接
  field :url,                        type: String

  belongs_to :site
  
end
