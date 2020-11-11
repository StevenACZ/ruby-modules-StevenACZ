require "minitest/autorun"
require_relative "warriors"
require_relative "../lib/io_test_helpers"

class DummyWarrior
  include BattleMoves
  attr_reader :name, :life, :weapon
  def initialize(name, weapon, life = 100)
    @name = name
    @life = life
    @weapon = weapon
  end
  
  def receive_damage(n)
    puts "receive_damage called"
  end

  def receive_healing(n)
    puts "receive_healing called"
  end
end

class WarriorsTest < Minitest::Test
  include IoTestHelpers
  def test_can_create_warrior
    # skip
    warrior = Warrior.new("Name")
    assert_instance_of(Warrior, warrior)
  end

  def test_can_read_warriors_name_life_weapon
    skip
    warrior = Warrior.new("Name")
    assert_equal warrior.name, "Name"
    assert_equal warrior.life, 100
    assert_nil warrior.weapon
  end

  def test_warrior_can_receive_a_weapon
    skip
    warrior = Warrior.new("Name")
    weapon = { name: "sword", power: 25 }

    output, _error = capture_io do
      warrior.receive_weapon(weapon)
    end

    assert_equal warrior.weapon, weapon
    assert_equal output, "Now I have a sword\n"
  end

  def test_warrior_can_receive_damage
    skip
    warrior = Warrior.new("Name")
    warrior.receive_damage(20)
    assert_equal warrior.life, 80
  end

  def test_warrior_can_receive_healing
    skip
    warrior = Warrior.new("Name")
    warrior.receive_damage(50)
    assert_equal warrior.life, 50
    warrior.receive_healing(50)
    assert_equal warrior.life, 100
    warrior.receive_healing(50)
    assert_equal warrior.life, 100
  end

  def test_warrior_respond_if_is_alive
    skip
    warrior = Warrior.new("Name")
    warrior.receive_damage(50)
    assert warrior.alife?
    warrior.receive_damage(50)
    refute warrior.alife?
  end

  def test_battlemoves_module_attack_calls_receive_damage_method
    skip
    weapon = { name: "sword", power: 25 }
    dummywarrior1 = DummyWarrior.new("Diego", weapon)
    dummywarrior2 = DummyWarrior.new("Wences", weapon)
    output, _error = capture_io do
      dummywarrior1.attack(dummywarrior2)
    end

    # line1 = "Diego attacks Wences!\n"
    line = "receive_damage called\n"
    # line3 = "Diego inflected 25 damage to Wences. Now they have 75 of life\n"

    assert_includes output.lines, line
  end

  def test_battlemoves_module_heal_calls_receive_healing_method
    skip
    weapon = { name: "sword", power: 25 }
    dummywarrior1 = DummyWarrior.new("Diego", weapon, 50)

    output, _error = capture_io do
      dummywarrior1.heal
    end

    line = "receive_healing called\n"

    assert_includes output.lines, line
  end

  def test_the_battle_as_a_whole
    skip
    inputs = [
      "sword",
      "staff",
      "attack",
      "attack",
      "attack",
      "attack",
      "attack",
      "attack",
      "heal",
      "attack",
      "attack",
      "attack",
    ]
    game = Battle.new
    simulate_stdin(*inputs) do
      output, _error = capture_io do
        game.start
      end
      assert_equal "Diego wins the battle\n", output.lines.last
    end
  end
end
