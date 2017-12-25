class CooperationPic
  include Mongoid::Document
  include Mongoid::Timestamps

  # 建立图片属性
  mount_uploader :avatar, AvatarUploader

  belongs_to :site
end
