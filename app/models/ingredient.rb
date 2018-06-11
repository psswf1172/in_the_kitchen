class Ingredient < ApplicationRecord
  belongs_to :recipe, inverse_of: :ingredients
  after_commit :reindex_recipe
  
  def reindex_recipe
    recipe.reindex
  end
end
