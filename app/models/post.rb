class Post < ApplicationRecord
  acts_as_paranoid
  has_many :post_images
  accepts_attachments_for :post_images, attachment: :image
  has_many :favorites
  belongs_to :user
  belongs_to :category, optional: true

  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true
  
end
