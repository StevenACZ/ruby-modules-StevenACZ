require "minitest/autorun"
require_relative "animals"

class DummyAnimal
  include Runner

  def specie
    "caballus"
  end
end

class AnimalsTest < Minitest::Test
  def test_can_create_animal
    # skip
    animal = Animal.new({ specie: "some specie", name: "some name" })
    assert_instance_of(Animal, animal)
  end

  def test_specie_and_name_are_not_required
    # skip
    animal = Animal.new
    assert_instance_of(Animal, animal)
  end

  def test_specie_and_name_are_set_unknown_when_not_given
    # skip
    animal = Animal.new

    output, _error = capture_io do
      p animal
    end

    assert_match '@specie="Unknown"', output
    assert_match '@name="Unknown"', output
  end

  def test_can_read_specie_and_name
    # skip
    animal = Animal.new({ specie: "some specie", name: "some name" })
    assert_equal animal.specie, "some specie"
    assert_equal animal.name, "some name"
  end

  def test_puts_some_animal_respond_with_custom_message
    # skip
    animal = Animal.new({ specie: "monkey", name: "george" })

    output, _error = capture_io do
      puts animal
    end

    assert_equal output.chomp, "My name is george and I'm a monkey"
  end

  def test_can_create_a_horse
    # skip
    horse = Horse.new
    assert_instance_of Horse, horse
  end

  def test_a_horse_is_an_animal
    # skip
    horse = Horse.new
    assert_kind_of Animal, horse
  end

  def test_a_horse_can_receive_a_name
    # skip
    horse = Horse.new("caballin")
    assert_equal "caballin", horse.name
  end

  def test_a_horse_specie_is_set_by_default
    # skip
    horse = Horse.new("caballin")
    assert_equal "caballus", horse.specie
  end

  def test_can_create_a_tiger
    # skip
    tiger = Tiger.new
    assert_instance_of Tiger, tiger
  end

  def test_a_tiger_is_an_animal
    # skip
    tiger = Tiger.new
    assert_kind_of Animal, tiger
  end

  def test_a_tiger_can_receive_a_name
    # skip
    tiger = Tiger.new("tigrillo")
    assert_equal "tigrillo", tiger.name
  end

  def test_a_tiger_specie_is_set_by_default
    # skip
    tiger = Tiger.new("tigrillo")
    assert_equal "tigris", tiger.specie
  end

  def test_runner_module_has_a_constant_of_velocities
    # skip
    refute_nil Runner::VELOCITIES
  end

  def test_runner_module_constant_of_velocities_is_a_hash
    # skip
    assert_instance_of Hash, Runner::VELOCITIES
  end

  def test_runner_module_constant_of_velocities_has_correct_keys_and_values
    # skip
    assert_equal ["caballus", "tigris"], Runner::VELOCITIES.keys
    assert_equal [40, 35], Runner::VELOCITIES.values
  end

  def test_runner_module_run_method_access_class_specie_and_return_correct_message
    # skip
    dummy_horse = DummyAnimal.new
    assert_output(stdout = "I have run 40 kilometers\n") { dummy_horse.run(1) }
    assert_output(stdout = "I have run 80 kilometers\n") { dummy_horse.run(2) }
    assert_output(stdout = "I have run 120 kilometers\n") { dummy_horse.run(3) }
  end

  def test_runner_module_run_method_works_on_horses
    # skip
    horse = Horse.new("caballin")
    assert_output(stdout = "I have run 40 kilometers\n") { horse.run(1) }
    assert_output(stdout = "I have run 80 kilometers\n") { horse.run(2) }
    assert_output(stdout = "I have run 120 kilometers\n") { horse.run(3) }
  end

  def test_runner_module_run_method_works_on_tigers
    # skip
    tiger = Tiger.new("tigrillo")
    assert_output(stdout = "I have run 35 kilometers\n") { tiger.run(1) }
    assert_output(stdout = "I have run 70 kilometers\n") { tiger.run(2) }
    assert_output(stdout = "I have run 105 kilometers\n") { tiger.run(3) }
  end
end
