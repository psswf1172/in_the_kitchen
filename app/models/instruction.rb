class Instruction < ApplicationRecord
  belongs_to :recipe, inverse_of: :instructions
  after_commit :reindex_recipe

  def reindex_recipe
    recipe.reindex
  end

end
