class GamesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @players = Player.where(game: @game)
    @player = Player.find_by(game: @game)
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user

    if @game.save
      flash[:success] = "Game Created"
      redirect_to games_path
    else
      flash.now[:alert] = @game.errors.full_messages.join(":( ")
      render :new
    end
  end

  def destroy
    @game = Game.find(params[:id]).destroy
    flash[:success] = "Game Deleted"
    redirect_to games_path
  end

  protected

  def game_params
    params.require(:game).permit(:user_id, :name, :sport, :start_date, :street_address, :city, :max_players)
  end
end
