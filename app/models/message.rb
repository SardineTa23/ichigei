class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :message, presence: true

  def set_date
    created_at.strftime("%m月%d日%H時%M分")
  end

  def short_description
    description[0, 100] + '...'
  end
end
