class Photo < ApplicationRecord
  has_many_attached :images

  scope :with_eager_loaded_image, -> { eager_load(image_attachment: :blob) }
  scope :with_preloaded_image, -> { preload(image_attachment: :blob) }

  validates :images, presence: true
  belongs_to :user, optional: true


  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
end
