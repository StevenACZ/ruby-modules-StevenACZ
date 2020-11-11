module Runner
  attr_writer :specie
  VELOCITIES = { "caballus" => 40, "tigris" => 35 }

  def run(time)
    time = case specie
    when "caballus" then time * VELOCITIES["caballus"]
    when "tigris" then time * VELOCITIES["tigris"]
    end
    puts "I have run #{time} kilometers"
  end
end

class Animal
  attr_reader :specie, :name

  def initialize(new_animal = {})
    @specie = new_animal[:specie].nil? ? "Unknown" : new_animal[:specie]
    @name = new_animal[:name].nil? ? "Unknown" : new_animal[:name]
  end

  def to_s
    "My name is #{@name} and I'm a #{@specie}"
  end
end

class Horse < Animal
  include Runner

  def initialize(name = "Unknown")
    @specie = "caballus"
    @name = name
  end
end

class Tiger < Animal
  include Runner

  def initialize(name = "Unknown")
    @specie = "tigris"
    @name = name
  end
end
