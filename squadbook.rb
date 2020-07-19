require "csv"

class Squadbook
  attr_reader :players
  attr_writer :add_player, :remove_player, :save_csv

  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @players = []
    load_csv
  end

  def all
    @players
  end

  def add_player(player)
    @players << player
    save_csv
  end

  def remove_player(index)
    @players.delete_at(index)
    save_csv
  end

  def find(index)
    @players[index]
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      @players.each{ |player| csv << [player.name, player.position, player.retired?] }
    end
  end

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      @players << Player.new(row[0], row[1], row[2])
    end
  end
end
