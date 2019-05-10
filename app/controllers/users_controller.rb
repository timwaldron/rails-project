class UsersController < ApplicationController
  include UsersHelper

  def transactions
    @items_purchased = ItemTransaction.where(buyer_id: current_user.id)
    @items_sold = ItemTransaction.where(seller_id: current_user.id)
  end

  def listings
    @user_id = params[:id]
    @games = Game.where(user_id: params[:id], sold: false)
  end

  def terms_of_use
    send_file "#{Rails.root}/app/assets/resources/TOU-LegalVision.pdf", type: "application/pdf", x_sendfile: true
  end
end