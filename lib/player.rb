class Player
  attr_accessor :name , :life_points

  def initialize (name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie."
  end

  def gets_damage(i)
    @life_points -= i
    if @life_points <= 0 
      puts "#{@name} a été zigouillé."
    end
  end

  def attacks(player)
    puts "#{@name} attaque #{player.name} et ça va faire mal !"
    damage = compute_damage
    player.gets_damage(damage)
    puts "#{player.name} vient de se prendre #{damage} points de dommages dans sa face !"
  end

  def compute_damage
    return rand(1..6)
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name, weapon_level)
    @weapon_level = weapon_level
    super(name)
  end
end