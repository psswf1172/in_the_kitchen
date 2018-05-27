class Recipe < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients
  has_many :instructions, dependent: :destroy
  accepts_nested_attributes_for :ingredients
  belongs_to :user
  validates :name, presence: true,
                   length: { minimum: 3 }
end
