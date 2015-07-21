class PlayersController < ApplicationController

  def new
    @game = Game.new
  end

  def create
    @game = Game.find(params[:game_id])
    @player = Player.find_or_initialize_by(game: @game, user: current_user) #replace @game with ajax data ('params')
    @player.save
    flash[:success] = "Game Joined"
    redirect_to game_path(@game)
  end

  def destroy
    @game = Game.find(params[:game_id])
    @player = Player.find_by(user: current_user, game: @game).destroy
    flash[:success] = "You've left this game"
    redirect_to game_path(@game)
  end

  protected

  def player_params
    params.require(:player).permit(:user_id, :game_id)
  end
end
