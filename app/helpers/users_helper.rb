module UsersHelper
  # Returns the whole User object

  def get_states_array
    return ['VIC', 'TAS', 'NSW', 'QLD', 'WA', 'NT', 'ACT']
  end

  def get_user(user_id)
    return User.find(user_id)
  end

  def get_username(user_id)
    return User.find(user_id).username
  end

  # Returns game object
  def get_game(game_id)
    return Game.find(game_id)
  end

  def get_transaction_history_columns
    return ["Invoice", "Title", "Platform", "Price", "Transaction Date"]
  end

  def platform_purchase_hash
    platform_count = {
      "PlayStation 4" => 0,
      "Xbox One" => 0,
      "PC" => 0,
      "Nintendo Switch" => 0
    }
    ItemTransaction.where(buyer_id: current_user.id).each { |transaction| platform_count[Game.find(transaction.item_id).platform] += 1 }

    return platform_count
  end
end