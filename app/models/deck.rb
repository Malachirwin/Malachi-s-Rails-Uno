class Deck < ApplicationRecord
  has_many :cards
  belongs_to :game

  def make_deck
    colors = ['Red', 'Yellow', 'Green', 'Blue']
    rank = 1
    2.times do
      colors.each.with_index do |color, index|
        9.times.map do |number|
          rank = number + 1
          Card.create(color: color, rank: rank.to_s, deck_id: id)
        end
        ["Reverse", "Skip", "Draw Two", "Wild", "Wild Draw Four"].each do |rank|
          if rank[0] == "W"
            Card.create(color: "Color", rank: rank.to_s, deck_id: id)
          else
            Card.create(color: color, rank: rank.to_s, deck_id: id)
          end
        end
      end
    end
  end

  def cards_in_deck
    array = []
    cards.map do |card|
      if card.game_id == nil && card.player_id == nil
        array.push card
      end
    end
    array
  end
end
