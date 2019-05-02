require 'resolv'

class NotifyMailer < ApplicationMailer
  helper_method :get_game

  def confirmation_sold_email
    @buyer = params[:buyer]
    @seller = params[:seller]
    @transaction = params[:transaction]

    mail(to: @seller.email, subject: 'Your game listing has been purchased!') if domain_has_mx?(@seller.email.split('@')[1])
  end

  def confirmation_bought_email
    @buyer = params[:buyer]
    @seller = params[:seller]
    @transaction = params[:transaction]

    
    mail(to: @buyer.email, subject: "Receipt: ##{@transaction.id}") if domain_has_mx?(@buyer.email.split('@')[1])
  end

  # Function to check if a domain has a mx record or not
  def domain_has_mx?(domain)
    Resolv::DNS.open do |dns|
      dns.getresources(domain, Resolv::DNS::Resource::IN::MX).count == 0 ? false : true
    end
  end

# Helpers
  # Returns game object
  def get_game(game_id)
    return Game.find(game_id)
  end
end
