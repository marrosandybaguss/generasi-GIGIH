require_relative "person.rb"

class Hero < Person
    def initialize(name, hitpoint, attack_demage)
        super(name, hitpoint, attack_demage)
        @deflect_precentage = 0.8
    end

    def take_demage(demage)
        if rand < @deflect_precentage
            puts "#{@name} deflects the attack."
        else
            @hitpoint -= demage
        end    
    end

end