class Cooperation
  include Mongoid::Document
  include Mongoid::Timestamps

  # 建立属性，标题和图片链接
  field :title,      type: String
  field :images,     type: String

  has_many   :photos
  belongs_to :site

end
