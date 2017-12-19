class Content
  include Mongoid::Document
  include Mongoid::Timestamps

  # 内容的文字属性
  field :title,       type: String
  field :word,        type: String

  has_many   :photos
  belongs_to :contents_class
end
