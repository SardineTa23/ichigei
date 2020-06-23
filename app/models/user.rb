class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image
  acts_as_paranoid
  validates :introduction, length: { maximum: 1000 }
  validates :display_name,
    presence: true,
    length: { maximum: 20,
               minimum: 2 }
  validates :name,
    presence: true,
    length: { maximum: 20,
               minimum: 2 }

  has_many :favorites, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :works
  has_many :book_marks, dependent: :destroy
  has_many :entries
  has_many :messages
  has_many :portfolios, dependent: :destroy
  has_many :employer_evaluations
  has_many :labor_evaluations

  enum status: { personal: 0, company: 1 }

  ##住所検索
  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

  def check_entry(work)
    Entry.find_by(work_id: work.id, user_id: self.id)
  end
end
