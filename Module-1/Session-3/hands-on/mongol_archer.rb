require_relative "villain.rb"

class MongolArcher < Villain
    def attack(other_person)
        puts "#{@name} shoot an arrow at #{other_person.name} with #{@attack_demage} demage."
        other_person.take_demage(@attack_demage)
    end
end