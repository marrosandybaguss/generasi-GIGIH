class Person
  attr_reader :name, :hitpoint
  
  def initialize(name, hitpoint, attack_demage)
    @name = name
    @hitpoint = hitpoint
    @attack_demage = attack_demage
    @alive = true
  end
  
  def print_stats
    puts "#{@name} has #{@hitpoint} hitpoint and #{@attack_demage} attack demage."
  end
  
  def attack(other_person)
    puts "#{@name} attacks #{other_person.name} with #{@attack_demage} demage."
    other_person.take_demage(@attack_demage)
  end
  
  def take_demage(demage)
    @hitpoint -= demage
    if @hitpoint <= 0
      die
    end
  end
  
  def die
    puts "#{@name} dies."
    @alive = false
  end

  def die?
    !@alive
  end

  def removed?
    die?
  end

end
