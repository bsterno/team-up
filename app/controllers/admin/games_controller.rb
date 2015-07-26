class Admin::GamesController < ApplicationController
  before_filter :authorize_admin!

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @address = @game.street_address
    @players = Player.where(game: @game)
    @player = Player.find_by(user: current_user, game: @game)
  end
end
