class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @games = Player.where(user: current_user)
  end

end
