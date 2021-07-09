require_relative "person.rb"

class Villain < Person
    def initialize(name, hitpoint, attack_demage)
        super(name, hitpoint, attack_demage)
        @flee_precentage = 0.5
        @field = false
    end

    def take_demage(demage)
        super(demage)
        if @hitpoint <= 50
            flee if rand < @flee_precentage
        end
    end

    def flee
        @field = true
        puts "#{@name} has field the battlefield with #{@hitpoint} hitpoint left."
    end

    def flee?
        @flee
    end

    def removed?
        die? || flee?
    end
end