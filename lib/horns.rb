class Horns

  LENGTH_OPTIONS = ['tiny', 'short', 'medium', 'long', 'very long'].freeze
  TWIST_OPTIONS  = ['straight', 'wavy', 'twisted'].freeze
  COLOR_OPTIONS  = ['black', 'light grey', 'white', 'dark grey', 'light brown'].freeze

  attr_reader :length, :twist, :color

  def initialize(length, twist, color)
    @length, @twist, @color = length, twist, color # parallel assignment (fun but unnecessary)
  end

  def to_s
    "#{length}, #{twist} #{color} horns"
  end

  def self.choose_randomly
    selected_length = random_choice(LENGTH_OPTIONS)
    selected_twist = random_choice(TWIST_OPTIONS)
    selected_color = random_choice(COLOR_OPTIONS)

    self.new(selected_length, selected_twist, selected_color)
  end

  def self.random_choice(options_array)
    options_array.sample
  end

end
