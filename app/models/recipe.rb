class Recipe < Post

  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients, allow_destroy: true, 
                                reject_if: :all_blank
                            
  has_many :instructions, dependent: :destroy
  accepts_nested_attributes_for :instructions, allow_destroy: true, 
                                reject_if: :all_blank

  has_many :comments, as: :commentable
end