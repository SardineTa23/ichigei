class Image < ApplicationRecord
  belongs_to :work
  attachment :image
end
