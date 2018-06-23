class Ingredient < ApplicationRecord

  belongs_to :recipe, inverse_of: :ingredients, touch: true

  searchkick

end
