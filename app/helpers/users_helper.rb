module UsersHelper
  # Returns the whole User object

  # Returns the states as an array
  def get_states_array
    return ['VIC', 'TAS', 'NSW', 'QLD', 'WA', 'NT', 'ACT']
  end

  # Returns the entire User object
  def get_user(user_id)
    return User.find(user_id)
  end

  # Returns a username from a User's ID
  def get_username(user_id)
    return User.find(user_id).username
  end

  # Returns game object
  def get_game(game_id)
    return Game.find(game_id)
  end

  # Gets the transaction history columns for the table
  def get_transaction_history_columns
    return ["Invoice", "Title", "Platform", "Price", "Transaction Date"]
  end
end