class Game < ApplicationRecord
  has_one_attached :image
  has_many_attached :images
  has_one_attached :instruction
end
