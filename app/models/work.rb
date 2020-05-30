class Work < ApplicationRecord
  acts_as_paranoid
  has_many :images
  accepts_attachments_for :images, attachment: :image
  has_many :book_marks
  belongs_to :user
  belongs_to :category, optional: true

  enum recruitment_status: { recruiting: 0,
                             recruitment_suspended: 1
                             end_recruitment: 2 }
end
