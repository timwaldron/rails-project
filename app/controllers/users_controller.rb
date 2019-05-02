class UsersController < ApplicationController
  helper_method :get_username, :get_game

  def transactions
    @items_purchased = ItemTransaction.where(buyer_id: current_user.id)
    @items_sold = ItemTransaction.where(seller_id: current_user.id)
  end

# Helper methods
  # Returns username
  def get_username(user_id)
    return User.find(user_id).username
  end

  # Returns game object
  def get_game(game_id)
    return Game.find(game_id)
  end
end