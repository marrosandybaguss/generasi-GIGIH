require_relative "person.rb"

class Ally < Person
    def take_heal(heal)
        @hitpoint += heal
    end
end