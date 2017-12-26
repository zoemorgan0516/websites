class Cooperation
  include Mongoid::Document
  include Mongoid::Timestamps

  # 建立图片属性
  mount_uploader :avatar,            AvatarUploader
  field :cooperation_company,            type: String
  field :cooperation_string,            type: String

  belongs_to :site
end
