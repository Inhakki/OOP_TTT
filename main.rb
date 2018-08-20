

puts "Tic Tac Toe! Play to win! How many players?"

player_number = gets.chomp

puts "What size grid? width:"

width = gets.chomp

puts "What size height?"

height = gets.chomp

puts "Setting up game..."

Game.new(player_number, width, height).start
