class Person
  attr_reader :name, :hitpoint
  
  def initialize(name, hitpoint, attack_demage)
    @name = name
    @hitpoint = hitpoint
    @attack_demage = attack_demage
  end
  
  def to_s
    "#{@name} has #{@hitpoint} hitpoint and #{@attack_demage} attack demage."
  end
  
  def attack(other_person)
    puts "#{@name} attacks #{other_person.name} with #{@attack_demage} demage."
    other_person.take_demage(@attack_demage)
  end
  
  def take_demage(demage)
    @hitpoint -= demage
  end
  
  def die?
    if @hitpoint <= 0
      puts "#{@name} dies."
      true
    end
  end

end
