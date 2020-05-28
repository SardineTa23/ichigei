class Post < ApplicationRecord
  has_many :fovorites
  has_many :post_images
  accepts_attachments_for :post_images, attachment: :image
  belongs_to :user
  belongs_to :category, optional: true

  validate :title, presence: true, length: { maximum: 50 }
  validate :content, presence: true
  
end
