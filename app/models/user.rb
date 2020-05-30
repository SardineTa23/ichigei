class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image
  acts_as_paranoid
  validates :introduction, length: { maximum: 1000 }

  has_many :favorites
  has_many :posts
  has_many :works
  has_many :book_marks

  enum status: { personal: 0, company: 1 }
end
