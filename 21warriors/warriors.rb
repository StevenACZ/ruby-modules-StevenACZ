module BattleMoves
  attr_writer :name, :life, :weapon

  def attack(target)
    puts "#{name} attack #{target.name}!"
    target.receive_damage(weapon[:power])
    puts "#{name} inflected #{weapon[:power]} damage to #{target.name}. Now they have #{target.life} of life"
  end

  def heal
    case weapon[:name]
    when "sword" then self::receive_healing(15)
    when "staff" then self::receive_healing(30)
    end
    puts "#{name} heals himself, now has #{life} of life"
  end
end

class Warrior
  include BattleMoves
  attr_reader :name, :life, :weapon

  def initialize(name)
    @name = name
    @life = 100
    @weapon = {}
  end

  def receive_weapon(weapon)
    @weapon = weapon
    puts "Now I have a #{weapon[:name]}"
  end

  def receive_damage(damage)
    @life.positive? && @life -= damage
    @life.negative? && @life = 0
  end

  def receive_healing(heal)
    @life <= 100 && @life += heal
    @life > 100 && @life = 100
  end

  def alife?
    @life.positive? ? true : false
  end
end

module Armory
  WEAPONS = { 
              "sword" => {
                name: "sword",
                power: 25
              },
              "staff" => {
                name: "staff",
                power: 20
              }
            }.freeze
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
