class GamesController < ApplicationController
  helper_method :find_username_by_id

  def index
    @games = Game.all.order("created_at ASC")
  end

  def handle_user_notfound
    return "ERROR"
  end

  def find_username_by_id(user_id)
    # user =  User.exists?(id: user_id)
    if User.exists?(id: user_id)
      return User.find(user_id).username
    else
      return "ERROR"
    end
  end
end
