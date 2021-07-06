require_relative "player.rb"


sandy = Player.new("Sandy", 100, 50)
bagus = Player.new("Bagus", 500, 50)
puts sandy
puts bagus
puts "\n"

loop do

	sandy.attack(bagus)
	puts bagus
	puts "\n"
	
	bagus.attack(sandy)
	puts sandy
	puts "\n"
	
	if sandy.die?
		break
	elsif bagus.die?
		break
	end
	

end
