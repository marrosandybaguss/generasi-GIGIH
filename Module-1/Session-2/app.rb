require_relative "hero.rb"
require_relative "ally.rb"
require_relative "mongol_archer.rb"
require_relative "mongol_spearman.rb"
require_relative "mongol_swordsman.rb"


jin = Hero.new("Jin Sakai", 100, 50)
yuna = Ally.new("Yuna", 90, 45)
ishikawa = Ally.new("Sensei Ishikawa", 80, 60)
allies = [yuna, ishikawa]
heroes = [jin, yuna, ishikawa]

mongol_archer = MongolArcher.new("Mongol Archer", 80, 40)
mongol_spearman = MongolSpearman.new("Mongol Spearman", 120, 60)
mongol_swordsman = MongolSwordsman.new("Mongol Swordsman", 100, 50)
villains = [mongol_archer, mongol_spearman, mongol_swordsman]

i = 0
until (heroes.empty? || villains.empty?) do
	puts "=========== Turn #{i} ==========="
	puts "\n"
	
	puts jin
	allies.each do |ally|
		puts ally
	end
	puts "\n"

	villains.each do |villain|
		puts villain
	end
	puts "\n"

	puts "As Jin Sakai, what do you want to do this run?"
	puts "1. Attack an enemy"
	puts "2. Heal an ally"
	jinTurn = gets

	if jinTurn.to_i == 1
		puts "Which enemy you want to attack?"
		j = 1
		villains.each do |villain|
			puts "#{j}. #{villain.name}"
			j += 1
		end
		enemyChoosen = gets

		jin.attack(villains[enemyChoosen.to_i-1])
	else
		puts "Which ally you want to heal?"
		j = 1
		allies.each do |ally|
			puts "#{j}. #{ally.name}"
			j += 1
		end
		allyChoosen = gets

		jin.heal(allies[allyChoosen.to_i-1])
	end

	allies.each do |ally|
		ally.attack(villains[rand(villains.size)])
	end
	villains.each do |villain|
		villains.delete(villain) if villain.die? || villain.flee?
	end
	puts "\n"

	villains.each do |villain|
		villain.attack(heroes[rand(heroes.size)])
	end
	heroes.each do |hero|
		heroes.delete(hero) if hero.die?
	end
	allies.each do |ally|
		allies.delete(ally) if ally.die?
	end
	puts "\n"

	i += 1
end