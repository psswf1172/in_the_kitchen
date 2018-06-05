class Family < ApplicationRecord
  has_many :users
  has_many :posts, through: :users
  has_many :recipes, through: :users
  has_many :photos, through: :users
  has_many :stories, through: :users

  validates :name, presence: true
end
