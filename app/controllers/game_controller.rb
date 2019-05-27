class GameController < ApplicationController
  require_relative './../lib/game'
  require_relative './../lib/game_holder'
  def new
    @game = Game.new
    @gameholder = GameHolder.new(game: @game, player_name: "Malachi")
  end

  def game_home
  end

  def game_over
  end
end
