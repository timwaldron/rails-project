class Game < ApplicationRecord
  validates_presence_of :title

  belongs_to :user
  has_many_attached :images
  self.per_page = 9
end