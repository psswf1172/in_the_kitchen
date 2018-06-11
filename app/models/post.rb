class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true,
                   length: { minimum: 3 }

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings, dependent: :destroy

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  searchkick inheritance: true

  settings do
    mappings dynamic: false do
      indexes :author, type: :text
      indexes :title, type: :text, analyzer: :english
      indexes :description, type: :text, analyzer: :english
    end
  end

  def self.search_published(query)
    self.search({
      query: {
        bool: {
          must: [
            {
              multi_match: {
                query: query,
                fields: [:author, :title, :description, :tags]
              }
            }]
        }
      }
    })
  end

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
