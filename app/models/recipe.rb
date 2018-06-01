class Recipe < Post

  has_many :comments, dependent: :destroy

  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients, allow_destroy: true, 
                                reject_if: :all_blank
                            
  has_many :instructions, dependent: :destroy
  accepts_nested_attributes_for :instructions, allow_destroy: true, 
                                reject_if: :all_blank

  has_many :taggings
  has_many :tags, through: :taggings

  def self.tagged_with(name)
    Tag.find_by_name!(name).recipes
  end
  
  def all_tags=(names)
    self.tags = names.split(",").map do | name |
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(",")
  end
end