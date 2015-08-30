class StatsController < ApplicationController

  def index
    @games = Game.all
  end

  protected

  def stat_params
    params.require(:game).permit(:user_id, :description, :sport_id, :start_date, :street_address, :max_players)
  end
end
