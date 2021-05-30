class Blog < ApplicationRecord
  belongs_to :user 
  has_one_attached :blog_image
  validate :acceptable_image
  def acceptable_image
    return unless blog_image.attached?
  
    unless blog_image.byte_size <= 1.megabyte
      errors.add(:blog_image, "is too big")
    end
  
    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(blog_image.content_type)
      errors.add(:blog_image, "must be a JPEG or PNG")
    end
  end
end
