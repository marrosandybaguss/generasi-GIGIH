require_relative "villain.rb"

class MongolSwordsman < Villain
    def attack(other_person)
        puts "#{@name} slashes #{other_person.name} with #{@attack_demage} demage."
        other_person.take_demage(@attack_demage)
    end
end