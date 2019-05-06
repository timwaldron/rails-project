class UsersController < ApplicationController
  include UsersHelper

  def transactions
    @items_purchased = ItemTransaction.where(buyer_id: current_user.id)
    @items_sold = ItemTransaction.where(seller_id: current_user.id)
  end

  def listings
    @user_listings = Game.where(user_id: params[:id], sold: false)
    @user_id = params[:id]
  end
end