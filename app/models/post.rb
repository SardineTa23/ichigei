class Post < ApplicationRecord
  acts_as_paranoid
  attachment :image, destroy: false
  has_many :favorites
  belongs_to :user
  belongs_to :category, optional: true

  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true
  

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
