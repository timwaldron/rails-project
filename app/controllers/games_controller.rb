class GamesController < ApplicationController
  before_action :set_game, only: [:edit, :update, :show, :destroy]
  # helper_method :find_username_by_id, :get_supported_platforms, :convert_item_condition
  include GamesHelper
  
  # CRUD

  def index
    @games = Game.where(:sold => false).paginate(:page => params[:page], :per_page => 9)
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
    @game = Game.find(params[:id])
    
    if @game.update(game_params)
      redirect_to show_game_path(params[:id])
      flash[:success] = "Your game listing has been updated"
    else
      render 'edit'
    end
  end

  def remove_image
    @game = Game.find(params[:id])

    if current_user && (current_user.admin? || current_user.id == @game.user.id)
      @game.images[params[:img_id].to_i].purge

      flash[:success] = "Upload was successfully removed."
    end

    redirect_to show_game_path(@game.id)
  end

  def destroy
    @game.destroy

    flash[:success] = "Your game was successfully deleted"
    redirect_to games_path
  end

  def search
    if (params[:search_title] != nil)
      platforms = []
      params.each do |key, value|
        if params[key.to_sym] == "on" 
          platforms << key
        end 
      end 

      @found_games = Game.where("LOWER(title) LIKE :query", query: "%#{params[:search_title].downcase}%").select do |game|
        platforms.include?(game.platform) && game.sold == false
      end
    end
  end

  def results

  end

  # Private params

  private
    def game_params
      params.permit(:title, :genre, :price, :platform, :condition, :sold, :note, :rating, :img_id, images: [])
    end
end
