class PlayersController < ApplicationController

  def new
    @game = Game.new
  end

  def create
    @game = Game.find(params[:game_id])
    @player = Player.find_or_initialize_by(game: @game, user: current_user)
    @player.save
    flash[:success] = "Game Joined"
    redirect_to game_path(@game)
  end

  def destroy
    @game = Game.find(params[:game_id])
    @player = Player.find(params[:id]).destroy
    flash[:success] = "You've left this game"
    redirect_to games_path
  end
  
end
