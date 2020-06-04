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


  def book_marked_by?(user)
    book_marks.where(user_id: user.id).exists?
  end
end
