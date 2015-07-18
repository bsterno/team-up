class GamesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    if params[:q].present?
      @games = Game.search(params[:q]).order("start_date DESC")
    else
      @games = Game.all.order("start_date DESC")
    end
  end

  def show
    @game = Game.find(params[:id])
    @address = @game.street_address
    @players = Player.where(game: @game)
    @player = Player.find_by(user: current_user, game: @game)
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
    params.require(:game).permit(:user_id, :description, :sport_id, :start_date, :street_address, :max_players)
  end
end
