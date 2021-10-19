require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

@player1
@player2
@human
@enemies = []

def welcome
  puts "------------------------------------------------"
  puts "Bienvenue dans le jeu de l'impossible décadence"
  puts "Ici, tu dois massacrer un max de personne !!!!!"
  puts "------------------------------------------------"
end

def human_create
  puts "Quels est ton prénom ?"
  print ">"
  return @human = HumanPlayer.new(gets.chomp)
end

def create_comput_user
    @player1 = Player.new("Josiane")
    @player2 = Player.new("José")
    @enemies << @player1
    @enemies << @player2
end

def fight
    while @human.life_points > 0 && (@player1.life_points > 0 || @player2.life_points > 0)
      puts ""
      puts "------------------------------------------------"
      puts "Quelle action veux-tu effectuer "
      puts ""
      puts "  a - chercher une meilleure arme"
      puts "  s - chercher à se soigner"
      puts ""
      puts "Attaquer un joueur en vue :"
      puts ""
      puts "  0 - #{@player1.name} a #{@player1.life_points} points de vie"
      puts "  1 - #{@player2.name} a #{@player2.life_points} points de vie"
      puts "  2 - Te faire attaquer par #{@player1.name} et #{@player2.name}"
      puts ""
      print "> "
      action = gets.chomp.to_s

      if action == "a" # Si 'a' cherche une arme
        puts ""
        puts "------------------------------------------------"
        @human.search_weapon
      elsif action == "s" # Si 's' cherche un pack de soin
        puts ""
        puts "------------------------------------------------"
        @human.search_health_pack
      elsif action == "0" # Si '0' le joueur attaque 'Josiane'
        puts ""
        puts "------------------------------------------------"
        @human.attacks (@player1)
      elsif action == "1" # Si '1' le joueur attaque 'José'
        puts ""
        puts "------------------------------------------------"
        @human.attacks (@player2)
      elsif action == "2" # Si '2' 'Josiane' et 'José' attaque le joueur
        puts ""
        puts "------------------------------------------------"
        puts "Les autres joueurs t'attaquent !"
        @enemies.each { |i| i.life_points <= 0 ? break : i.attacks(@human) }
        @human.show_state
      else
        puts "______________ Tu n'as pas entré la bonne valeur _______________"
        puts "--- Entre 'a' pour partir à la recherche d'une arme-----------"
        puts "--- Entre 's' pour partir à la recherche  d'un pack de soin---"
        puts "--- Entre '0' pour attaquer Josiane --------------------------"
        puts "--- Entre '1' pour attaquer José -----------------------------"
        puts "--- Entre '2' pour se faire attaquer par Josiane et José -----"
      end
      
    end
    puts "La partie est finie"

    if @human.life_points >= 1
      puts ""
      puts "BRAVO ! TU AS GAGNE !"
    else
      puts ""
      puts "Tu viens de te faire éclater"
    end
end

def perform
  welcome
  human_create
  create_comput_user
  fight
end

perform
