require_relative "samurai.rb"
require_relative "army.rb"


sandy = Samurai.new("Sandy", 100, 50)
bagus = Army.new("Bagus", 500, 50)
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
