class Scar

  PROBABILITY = 0.1

  SIZE_OPTIONS = ['small', 'medium-sized', 'large', 'massive'].freeze
  SHAPE_OPTIONS  = ['keiloid', 'burn', 'intentional scarification', 'surgical', 'jagged'].freeze
  LOCATION_OPTIONS  = ['back', 'forearm', 'bicep', 'calf', 'thigh', 'chest'].freeze

  attr_reader :size, :shape, :location

  def initialize(size, shape, location)
    @size = size
    @shape = shape
    @location = location
  end

  def shape_string
    if shape == 'intentional scarification'
      shape
    else
      "#{shape} scar"
    end
  end

  def to_s
    "a #{size} #{shape_string} on your #{location}"
  end

  def self.choose_randomly
    return nil unless (rand < PROBABILITY)

    selected_size = random_choice(SIZE_OPTIONS)
    selected_shape = random_choice(SHAPE_OPTIONS)
    selected_location = random_choice(LOCATION_OPTIONS)

    self.new(selected_size, selected_shape, selected_location)
  end

  def self.random_choice(options_array)
    options_array.sample
  end
end
