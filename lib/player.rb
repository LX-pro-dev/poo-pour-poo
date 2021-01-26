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

  def initialize(name)
    @weapon_level = 1
    @life_points = 100
    @name = name
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}."
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end 

  def search_weapon
    weapon_level = rand(1..6)
    puts "#{@name}, tu as trouvé une arme de niveau #{weapon_level}."
    if(weapon_level > @weapon_level)
      @weapon_level = weapon_level
      puts "Youhou ! Elle est meilleure que ton arme actuelle : tu la prends."
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle...c'est trop nul ..."
    end

  end

  def search_health_pack
    dice = rand(1..6)
    if dice == 1 
      puts "Tu n'as rien trouvé : ("
    elsif dice >1 && dice <6 
      @life_points += 50
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      if @life_points > 100 
        @life_points = 100
      end
    else
      @life_points += 80
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
      if @life_points > 100 
        @life_points = 100
      end
    end
  end
end