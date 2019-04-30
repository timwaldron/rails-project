class GamesController < ApplicationController
  helper_method :find_username_by_id, :get_supported_platforms

  # CRUD

  def index
    @games = Game.all.order("created_at ASC")
  end

  def handle_user_notfound
    return "ERROR"
  end

  def show
    @game = Game.find(params[:id])
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])

    if @game.update(game_params)
      redirect_to show_game_path(params[:id])
    else
      render 'edit'
    end
  end

  # Helper Method's

  def find_username_by_id(user_id)
    
    if User.exists?(id: user_id)
      return User.find(user_id).username
    else
      # Logic to email support about an issue
      return "User is missing"
    end
  end

  def get_supported_platforms
    @platforms = ['PlayStation 4', 'Xbox One', 'Nintendo Switch', 'PC']
  end

  private
    def game_params
      params.permit(:title, :genre, :price, :platform, :condition, :sold, :note, :rating)
    end
end
