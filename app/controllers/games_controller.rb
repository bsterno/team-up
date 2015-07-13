class GamesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user

    if @game.save
      flash[:notice] = "Game Created"
      redirect_to games_path
    else
      flash.now[:alert] = @game.errors.full_messages.join(":( ")
      render :new
    end
  end

  def destroy
    @game = Game.find(params[:id]).destroy
    flash[:notice] = "Game Deleted"
    redirect_to games_path
  end

  protected

  def game_params
    params.require(:game).permit(:name, :sport, :start_date, :street_address, :city, :max_players)
  end
end
