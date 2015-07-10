class LobbiesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :new]
  def index
    @lobbies = Lobby.all
  end

  def new
    @lobby = Lobby.new
  end

  def create
    @lobby = Lobby.new(lobby_params)
    @lobby.user = current_user

    if @lobby.save
      flash[:notice] = "Lobby Created"
      redirect_to lobbies_path
    else
      render :new
    end
  end

  protected

  def lobby_params
    params.require(:lobby).permit(:game, :name, :max_players)
  end
end
