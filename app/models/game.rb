class Game < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  self.per_page = 9
end

WillPaginate.per_page = 9