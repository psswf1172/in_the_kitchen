require "elasticsearch/model"

class Story < Post
  has_many :comments, as: :commentable
  
end
