class PlayedCard < ApplicationRecord
  has_many :cards
  belongs_to :game
end
