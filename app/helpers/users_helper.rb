module UsersHelper
  # Returns the whole User object
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
end