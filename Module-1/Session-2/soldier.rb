require_relative "person.rb"

class Soldier < Person

    def attack(other_person)
        puts "#{@name} attacks #{other_person.name} with #{@attack_demage} demage."
    
        if !other_person.deflect()
            other_person.take_demage(@attack_demage)
        else
            puts "#{other_person.name} deflects the attack."
        end
        
    end

end