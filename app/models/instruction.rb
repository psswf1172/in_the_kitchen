class Instruction < ApplicationRecord

  belongs_to :recipe, inverse_of: :instructions

  searchkick

end
