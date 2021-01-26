require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

@player1 = Player.new("José")
@player2 = Player.new("Josiane")

puts "A ma droite #{@player1.name}"
puts "A ma gauche #{@player2.name}"
puts "Voici l'état de chaque combattant :"
@player1.show_state
@player2.show_state

puts "Que le combat commence !"
while (@player1.life_points > 0 && @player2.life_points > 0) do
  @player1.attacks(@player2)
  @player2.show_state
  
  if @player2.life_points > 0
    @player2.attacks(@player1)
    @player1.show_state
    if @player1.life_points < 0
      puts "#{@player2.name} a gagné !"
    end
  else
    puts "#{@player1.name} a gagné !" 
  end
  puts ""
end

puts "Fin de la partie ! ah bein dis donc ça a cassé du chicot aujourd'hui !"



binding.pry