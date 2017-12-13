class Content
  include Mongoid::Document
  include Mongoid::Timestamps

  mount_uploaders :images, ImageUploader

  # 内容的文字属性
  field :word,        type: String
  # 内容的图片属性
  field :images,      type: String
  validates :images, presence: true

  belongs_to :site
  has_many   :photos
end
