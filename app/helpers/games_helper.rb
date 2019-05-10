module GamesHelper

  def find_username_by_id(user_id)
    
    if User.exists?(id: user_id)
      return User.find(user_id).username
    else
      # Logic to email support about this issue
      return "User is missing"
    end
    
  end

  def get_supported_platforms
    @platforms = ['PlayStation 4', 'Xbox One', 'Nintendo Switch', 'PC']
  end

  def convert_item_condition(condition_int)
    case condition_int
    when 4
      "Brand New"
    when 3
      "Like New"
    when 2
      "Very Good"
    when 1
      "Good"
    when 0
      "Acceptable"
    else
      # Logic to email support about this issue
      "Error: #{condition_int}"
    end
  end

  def set_game
    @game = Game.find(params[:id]) if params[:id] != nil
  end
end