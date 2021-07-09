require_relative "person.rb"

class Hero < Person
    def initialize(name, hitpoint, attack_demage)
        super(name, hitpoint, attack_demage)
        @deflect_precentage = 0.8
        @restrore_hitpoint = 20
    end

    def take_demage(demage)
        if rand < @deflect_precentage
            puts "#{@name} deflects the attack."
        else
            super(demage)
        end    
    end

    def heal(other_person)
        other_person.take_heal(@restrore_hitpoint)
        puts "#{@name} heals #{other_person.name}, restroring #{@restrore_hitpoint} hitpoints."
    end

    def take_heal(heal)
        @hitpoint += heal
    end

end