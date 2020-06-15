class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :work
  has_one :room
  has_one :employer_evaluation
  has_one :labor_evaluation
  enum working_status: { unsettled: 0, confirmed: 1, completed: 2 }
end
