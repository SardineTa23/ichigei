class Work < ApplicationRecord
  acts_as_paranoid
  attachment :image, destroy: false
  has_many :book_marks
  has_many :entries
  belongs_to :user
  belongs_to :category, optional: true

  enum recruitment_status: { recruiting: 0,
                             recruitment_suspended: 1,
                              end_recruitment: 2 }

  validates :title,
    presence: true,
    uniqueness: true,
    length: { maximum: 20,
               minimum: 2 }
  validates :description, presence: true
  validates :condition, presence: true
  validates :started_at, presence: true
  validates :ended_at, presence: true
  validates :reward, presence: true
  

  ##住所検索
  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

  def book_marked_by?(user)
    book_marks.where(user_id: user.id).exists?
  end
end
