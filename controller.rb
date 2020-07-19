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
    retired = false
    player = Player.new(name, position, retired)
    @squadbook.add_player(player)
  end

  def update
    display_players
    index = @view.ask_user_for_index
    player = @squadbook.find(index)
    player.mark_as_retired!
    @squadbook.save_csv
  end

  def destroy
    display_players
    index = @view.ask_user_for_index
    @squadbook.remove_player(index)
  end

  def display_players
    players = @squadbook.all
    @view.display(players)
  end
end
