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

  def shuffle
    card_deck.shuffle!
  end

  def cards_left
    card_deck.length
  end

  def deal(deck, *players)
    shuffle
    players.each do |player_hand|
      5.times do
        player_hand.player_hand.push(remove_top_card)
      end
    end
    players
  end

  def remove_top_card
    card_deck.shift
  end

  def remove_all_cards_from_deck
    @deck = []
  end

  def add_cards_and_shuffle(cards)
    @deck.concat(cards)
    @deck.each do |card|
      if card.rank == "Wild" || card.rank == "Wild Draw Four"
        card.change_color("Color")
      end
    end
    shuffle
  end

  def has_cards?
    if cards_left > 0
      return true
    end
  end

  private

  def card_deck
    cards
  end
end
