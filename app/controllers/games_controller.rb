class GamesController < ApplicationController
  def index
    @users = User.all
    p @users
    
    @games = Game.all
    p @games
  end
end
