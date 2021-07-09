# non_playable_characters = {heroes: [], villains: []}
# puts non_playable_characters

puts "As Jin Sakai, what do you want to do this run?"
puts "1. Attack an enemy"
puts "2. Heal an ally"

selected_action_index = gets.chomp.to_i - 1
puts "\n"

puts @actions[selected_action_index]

