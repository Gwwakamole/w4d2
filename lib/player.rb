class Player
  
  attr_accessor :name, :life_points, :damage

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts ""
    puts "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(life_lost)
    @life_points -= life_lost
    if @life_points <= 0
      puts "le joueur #{@name} a été tué !"
    else
    end
  end

  def attacks(player)
    @damage = compute_damage

    puts ""
    puts "Le joueur #{self.name} attaque le joueur #{player.name}"
    puts ""
    puts "Il lui inflige #{damage} points de dommages"
    puts ""

    player.gets_damage(damage)
  end

  def compute_damage
    return rand(1..6)
  end

end

class HumanPlayer < Player
  
  attr_accessor :weapon_level

  def initialize(name)
    @name = name
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts ""
    puts "#{@name} a #{@life_points} et une arme de niveau #{@weapon_level}"
  end
  
  def compute_damage
    rand(1..6) * @weapon_level
  end
    
  def search_weapon
    weapon_random = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{weapon_random}"

    if weapon_random > @weapon_level
      lvl = weapon_random - @weapon_level
      @weapon_level = weapon_random
      puts "Youhou ! elle est meilleure de #{lvl} niveaux que ton arme actuelle : tu la prends."
    else
      puts "M@*$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    health_pack = rand(1..6)

    if health_pack == 1
      puts "Tu n'as rien trouvé..."

    elsif health_pack >= 2 && health_pack <= 5

      if @life_points >= 50
       @life_points = 100
      else
       @life_points += 50
      end

    else

      if @life_points >= 50
        @life_points = 100
      else
        @life_points += 80
      end
     
    puts "Waow, tu as trouvé un pack de +80 points de vie !"
    end 

  end
      
end
