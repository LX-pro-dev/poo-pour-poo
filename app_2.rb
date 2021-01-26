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
i = 1
while(@player1.life_points >0 && (@player2.life_points > 0 || @player3.life_points > 0))
  puts ""
  puts "Round #{i} ! Fight !"
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
  while(rep != 'a' && rep != 's'  && rep != '0' && rep != '1') do
    puts "T'as des problèmes avec tes doigts ? Tu tapes n'imp' mon gars !"
    puts "c'est a, s, 0 ou 1 !!!"
    rep = gets.chomp
  end

  if rep == 'a'
    @player1.search_weapon
  elsif rep == 's'
    @player1.search_health_pack
  elsif rep == '0'
    @player1.attacks(@player2)
  else
    @player1.attacks(@player3)
  end
  puts ""
  arr_ennemies.each do |ennemy|
    if(ennemy.life_points > 0)
      puts ""
      puts "#{ennemy.name} t'attaque !"
      ennemy.attacks(@player1)
    end
  end
  i += 1
  puts ""
  puts "Pour continuer, tape sur ce que tu veux ..."
  puts "mais fais attention à pas taper trop fort quand même... _JanBlag1"
  gets.chomp
  puts ""
end

if(@player1.life_points > 0) 
  puts "You win !"
else 
  puts "You loose !"
end
puts "La partie est belle et bien finie !"

binding.pry