class Card < ApplicationRecord
  belongs_to :deck

def rank
  rank
end

def to_img_path
  if rank.length == 1
    "#{color[0].downcase}#{rank}.jpg"
  else
    if rank == "Wild"
      "wild.jpg"
    elsif rank == "Wild Draw Four"
      "w+4.jpg"
    elsif rank == "Draw Two"
      "#{color[0].downcase}+2.jpg"
    elsif rank == "Reverse"
      "#{color[0].downcase}r.jpg"
    elsif rank == "Skip"
      "#{color[0].downcase}s.jpg"
    end
  end
end

def color
  color
end

def rank_comparing_value
  if rank.length == 1
    rank.to_i
  else
    rank
  end
end

def change_color(new_color)
  color = new_color
end

def value
  "#{color} #{rank}"
end

def card_value
  if color != "Color"
    "#{color} #{rank}"
  else
    rank
  end
end

end
