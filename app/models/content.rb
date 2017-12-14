class Content
  include Mongoid::Document
  include Mongoid::Timestamps

  # 内容的文字属性
  field :title,       type: String
  field :word,        type: String

  belongs_to :site
  has_many   :photos
end
