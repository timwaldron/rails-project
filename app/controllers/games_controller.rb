class GamesController < ApplicationController
  before_action :set_game, only: [:edit, :update, :show, :destroy]
  helper_method :find_username_by_id, :get_supported_platforms, :convert_item_condition
  
  # CRUD

  def index
    @games = Game.all.order("created_at DESC")

    @item_transactions = ItemTransaction.all
  end

  def new
    if (!user_signed_in?)
      flash[:danger] = "You must be signed in to use this feature"
      redirect_to new_user_session_path
    else
      @game = Game.new
    end
  end

  def create
    @game = Game.new(game_params.merge(user_id: current_user.id, sold: false))
    
    if @game.save
        flash[:success] = "Your Game was successfully created"
        redirect_to show_game_path @game.id
      else
        render 'new'
      end
  end

  def handle_user_notfound
    return "ERROR"
  end

  def show
  end

  def edit
    if current_user && current_user.admin?
      render 'edit'
      return
    end 
    if @game.user != current_user 
      flash[:danger] = "Unauthorized Access"
      redirect_to root_path
    end
  end

  def update
    if @game.update(game_params)
      redirect_to show_game_path(params[:id])
      flash[:success] = "Your game listing has been updated"
    else
      render 'edit'
    end
  end

  def destroy
    @game.destroy
    flash[:success] = "Your game was successfully deleted"
    redirect_to games_path
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
    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.permit(:title, :genre, :price, :platform, :condition, :sold, :note, :rating, images: [])
    end
end
