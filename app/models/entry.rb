class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :work
  belongs_to :room, optional: true
  enum working_status: { unsettled: 0, confirmed: 1, completed: 2 }
end
