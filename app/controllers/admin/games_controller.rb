class Admin::GamesController < ApplicationController
  before_filter :authorize_admin!

  def index
    @games = Game.all
  end
end
