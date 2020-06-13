class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :work
  has_one :room
  enum working_status: { unsettled: 0, confirmed: 1, completed: 2 }
end
