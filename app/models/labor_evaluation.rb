class LaborEvaluation < ApplicationRecord
  belongs_to :user
  belongs_to :entry

  validates :evaluation, numericality: { less_than_or_equal_to: 5 }
end
