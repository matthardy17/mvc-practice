class View
  def display(players)
    players.each_with_index do |player, index|
      retired = player.retired? ? "Retired" : "Active"
      puts "#{index + 1} - #{player.name}: #{player.position} - #{retired}"
    end
  end

  def ask_user_for_player
    puts "What is the players name?"
    gets.chomp.capitalize
  end

  def ask_user_for_position
    puts "What is the players position?"
    gets.chomp.capitalize
  end

  def ask_user_for_index
    puts "Which number player?"
    gets.chomp.to_i - 1
  end
end
