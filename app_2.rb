require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "*----------------------------------------------*"
puts "*        Bienvenue sur 'POO pour POO'          *"
puts "*     Le but du jeu est d'être comme ken       *"
puts "*           dans 'Hokuto no Ken'               *"
puts "*----------------------------------------------*"

puts "Qui va là j'te prie ? (Gtraduction : 'donne ton blaze mec !')"
@name = gets.chomp
@player1 = HumanPlayer.new(@name)

@player2 = Player.new("Josiane")
@player3 = Player.new("José")

arr_ennemies = []
arr_ennemies.push(@player2)
arr_ennemies.push(@player3)

puts "A ma droite : #{@player1.name}"
puts "A ma gauche : "
arr_ennemies.each do |ennemy|
  puts "- #{ennemy.name}"
end 

puts ""
puts "Que le combat commence !"
while(@player1.life_points >0 && (@player2.life_points > 0 || @player3.life_points > 0))
  puts ""
  @player1.show_state
  puts ""
  puts "Quelle action veux-tu effectuer ?"
  puts ""
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts ""
  puts "attaquer un joueur en vue :"
  
  arr_ennemies.each_with_index do |ennemy, index|
    if(ennemy.life_points > 0) 
      print "#{index} - "
      ennemy.show_state
    end
  end

  rep = gets.chomp
  puts rep
  #while(rep != 'a' || rep != 's' || rep != '0' || rep != '1')
  #  puts "Tu as des problèmes avec tes doigts ? Tu tapes n'imp mon gars ! \n c'est a, s, 0 ou 1 !!!"
  #end

  if rep == 'a'
    @player1.search_weapon
  elsif rep == 's'
    @player1.search_health_pack
  elsif rep == '0'
    @player1.attacks(@player2)
  else
    @player1.attacks(@player3)
  end

  
  arr_ennemies.each do |ennemy|
    if(ennemy.life_points > 0)
      puts "#{ennemy.name} t'attaque !"
      ennemy.attacks(@player1)
    end
  end
end
if(@player1.life_points > 0) 
  puts "You win !"
else puts "You loose !"
end


binding.pry