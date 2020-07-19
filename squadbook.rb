require "csv"

class Squadbook
  attr_reader :players
  attr_writer :add_player, :remove_player

  def initialize(csv_file_path)
    @players = []
    @csv_file_path = csv_file_path
    load_csv
  end

  def all
    @players
  end

  def add_player(player)
    @players << player
    save_csv
  end

  def remove_player(player_index)
    @players.delete_at(player_index)
    save_csv
  end

  private

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      @players.each{ |player| csv << [player.name, player.position] }
    end
  end

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      @players << Player.new(row[0], row[1])
    end
  end
end
