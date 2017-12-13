class SliderPicture
  include Mongoid::Document
  include Mongoid::Timestamps
  # 滑动图片上的内容
  field :content,              type: String
  # 关联关系
  belongs_to :site
end
