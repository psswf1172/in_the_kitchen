class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true,
                   length: { minimum: 3 }

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings, dependent: :destroy

  # searchkick

  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks

  # settings do
  #   mappings dynamic: false do
  #     indexes :author, type: :text
  #     indexes :title, type: :text, analyzer: :english
  #     indexes :description, type: :text, analyzer: :english
  #   end
  # end


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
