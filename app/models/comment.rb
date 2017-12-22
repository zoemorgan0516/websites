class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  #评论内容
  field :content, type: String
  validates_presence_of :content, message: "评论内容不能为空"

  #关联关系
  belongs_to :article

end
