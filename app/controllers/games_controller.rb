class GamesController < ApplicationController
  def index
    @users = User.all

    @users.each do |user|
      p user
    end
  end
end
