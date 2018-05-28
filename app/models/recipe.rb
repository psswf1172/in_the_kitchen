class Recipe < ApplicationRecord

  belongs_to :user

  has_many :comments, dependent: :destroy

  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients, allow_destroy: true, 
                                reject_if: :all_blank
                            
  has_many :instructions, dependent: :destroy
  accepts_nested_attributes_for :instructions, allow_destroy: true, 
                                reject_if: :all_blank

  validates :name, presence: true,
                   length: { minimum: 3 }

end