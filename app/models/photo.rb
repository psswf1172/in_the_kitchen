class Photo < Post
  has_many_attached :images

  scope :with_eager_loaded_image, -> { eager_load(image_attachment: :blob) }
  scope :with_preloaded_image, -> { preload(image_attachment: :blob) }

  validates :images, presence: true

  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  has_many :comments, as: :commentable
end
