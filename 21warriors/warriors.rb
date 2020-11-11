module BattleMoves
  # Your code here
end

class Warrior
  # Your code here
end

module Armory
  # Your code here
end

class Battle
  include Armory

  def initialize
    @warrior1 = Warrior.new("Diego")
    @warrior2 = Warrior.new("Wences")
  end

  def start
    select_weapon(@warrior1)
    select_weapon(@warrior2)

    puts "Let's the battle start!"

    while @warrior1.alife? && @warrior2.alife?
      make_move(@warrior1, @warrior2)

      break unless @warrior2.alife?

      make_move(@warrior2, @warrior1)
    end

    winner = @warrior1.alife? ? @warrior1 : @warrior2

    puts "#{winner.name} wins the battle"
  end

  def select_weapon(warrior)
    puts "#{warrior.name}, sword or staff?"
    weapon = gets.chomp
    warrior.receive_weapon(Armory::WEAPONS[weapon])
  end

  def make_move(warrior1, warrior2)
    puts "#{warrior1.name}, attack or heal?"
    move = gets.chomp
    warrior1.attack(warrior2) if move == "attack"
    warrior1.heal if move == "heal"
  end
end

# Descomment this lines if you want to try the game :)
# game = Battle.new
# game.start
