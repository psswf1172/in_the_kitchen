class Recipe < Post

  has_many :ingredients, inverse_of: :recipe, dependent: :destroy
  accepts_nested_attributes_for :ingredients, allow_destroy: true, 
                                reject_if: :all_blank
                            
  has_many :instructions, inverse_of: :recipe, dependent: :destroy
  accepts_nested_attributes_for :instructions, allow_destroy: true, 
                                reject_if: :all_blank

  has_many :comments, as: :commentable
  has_many :notes, as: :notable

  validates_associated :ingredients
  validates_associated :instructions

  def chapter_search(chapter)
    instance_variable_set("@#{chapter}", Searchkick.search(chapter))
  end
end