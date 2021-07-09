require_relative "hero.rb"

class PlayableCharacter < Hero
    def initialize(name, hitpoint, attack_demage)
        super(name, hitpoint, attack_demage)
        @actions = ["attack", "heal"]
    end

    def play_turn(heroes, villains)
        action = select_action
        if action == "heal"
            target = select_target(action, heroes)
            heal(target)
        else
            target = select_target(action, villains)
            attack(target)
            villains.delete(target) if (target.die? || target.flee?)
        end
    end

    def select_action
        puts "As Jin Sakai, what do you want to do this run?"
        puts "1. Attack an enemy"
        puts "2. Heal an ally"
        
        selected_action_index = gets.chomp.to_i - 1
        puts "\n"

        @actions[selected_action_index]
    end

    def select_target(action, targets)
        puts "Which character do you want to #{action}?"
        targets.each_with_index do |target, index|
            puts "#{index+1}. #{target.name}"
        end
        select_target_index = gets.chomp.to_i - 1
        puts "\n"

        select_target = targets[select_target_index]
    end


end