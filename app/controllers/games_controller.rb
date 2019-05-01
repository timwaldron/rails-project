class GamesController < ApplicationController
  helper_method :find_username_by_id, :get_supported_platforms, :convert_item_condition

  # CRUD

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

    if (!user_signed_in?)
      flash[:success] = "You must be signed in to use this feature"
      redirect_to new_user_session_path
    end

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
      flash[:success] = "You game listing has been updated"
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
      # Logic to email support about this issue
      return "User is missing"
    end
  end

  def get_supported_platforms
    @platforms = ['PlayStation 4', 'Xbox One', 'Nintendo Switch', 'PC']
  end

  def convert_item_condition(condition_int)
    case condition_int
    when 4
      "Brand New"
    when 3
      "Like New"
    when 2
      "Very Good"
    when 1
      "Good"
    when 0
      "Acceptable"
    else
      # Logic to email support about this issue
      "Error: #{condition_int}"
    end
  end

  # Private params

  private
    def game_params
      params.permit(:title, :genre, :price, :platform, :condition, :sold, :note, :rating, :images)
    end
end
