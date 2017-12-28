class ContentsClass
  include Mongoid::Document
  include Mongoid::Timestamps
  ## 分类名
  field :name,    type: String

  has_many    :contents
  belongs_to  :site
end
