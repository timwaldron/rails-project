class Game < ApplicationRecord
  validates_presence_of :title # Validates title when creating a game listing
  belongs_to :user
  has_many_attached :images
  self.per_page = 9 # Pagination
end