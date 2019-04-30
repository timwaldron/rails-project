class GamesController < ApplicationController
  helper_method :find_username_by_id

  def index
    @games = Game.all.order("created_at ASC")
  end

  def create
    @game = Game.new(game_params.merge(user_id: current_user.id))

    if @game.save
        flash[:success] = "A Game was successfully created"
        redirect_to show_game_path @game.id
      else
        render 'new'
      end
  end

  def new
    @game = Game.new
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

  private
    def game_params
      params.permit(:title, :genre, :price, :platform, :condition, :sold, :note, :rating)
    end
end
