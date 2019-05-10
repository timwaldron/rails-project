class UsersController < ApplicationController
  include UsersHelper

  # Returns purchased and sold items for the transactions view
  def transactions
    @items_purchased = ItemTransaction.where(buyer_id: current_user.id)
    @items_sold = ItemTransaction.where(seller_id: current_user.id)
  end

  # Returns user_id and games for 'My Listings' / '<users> listings'
  def listings
    @user_id = params[:id]
    @games = Game.where(user_id: params[:id], sold: false)
  end

  def terms_of_use
    send_file "#{Rails.root}/app/assets/resources/TOU-LegalVision.pdf", type: "application/pdf", x_sendfile: true
  end
end