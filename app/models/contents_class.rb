class ContentsClass
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name,    type: String

  has_many    :contents
  belongs_to  :site
end
