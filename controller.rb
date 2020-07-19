require_relative "view"
require_relative "player"
require_relative "squadbook"

class Controller
  def initialize(squadbook)
    @squadbook = squadbook
    @view = View.new
  end

  def list
    display_players
  end

  def create
    name = @view.ask_user_for_player
    position = @view.ask_user_for_position
    player = Player.new(name, position)
    @squadbook.add_player(player)
  end

  def destroy
    display_players
    player_index = @view.ask_user_for_index
    @squadbook.remove_player(player_index)
  end

  def display_players
    players = @squadbook.all
    @view.display(players)
  end
end
