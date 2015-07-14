class SportsController < ApplicationController
  before_action :authenticate_user!

  def new
    @sport = Sport.new
    @sports = Sport.all.order(:name)
  end

  def create
    @sport = Sport.new(sport_params)
    @sports = Sport.all.order(:name)

    if @sport.save
      flash[:success] = "Sport Added"
      redirect_to new_game_path
    else
      flash.now[:alert] = @sport.errors.full_messages.join(":( ")
      render :new
    end
  end

  protected

  def sport_params
    params.require(:sport).permit(:name)
  end
end
