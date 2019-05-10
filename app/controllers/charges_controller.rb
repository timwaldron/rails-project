class ChargesController < ApplicationController
  def new
  end
  
  def create
    @game = Game.find(params[:game_id])
    @user = User.find(params[:user_id])
    
    item_params = {
      item_id: @game.id,
      buyer_id: @user.id,
      seller_id: @game.user.id
    }

    @item_transaction = ItemTransaction.new(item_params)
    @item_transaction.save

    @amount = (@game.price * 100).to_i
  
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'aud',
    })

    puts "Created item transaction: #{item_params}"
  
    @game.update(:sold => true)

    # @user is the buyer
    # @game.user.id is the seller

    NotifyMailer.with(buyer: @user, seller: @game.user, transaction: @item_transaction).confirmation_bought_email.deliver_now
    NotifyMailer.with(buyer: @user, seller: @game.user, transaction: @item_transaction).confirmation_sold_email.deliver_now

    redirect_to show_game_path(@game.id)

    @sold_price = @game.price.to_s
    @sold_price += "0" if @sold_price.split('.')[1].length == 1

    flash[:success] = "You have sucessfully purchased this listing for $#{@sold_price}"

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to show_game_path(@game.id)
    end
end