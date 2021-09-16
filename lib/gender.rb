class Gender

  WEIGHTED_OPTIONS = {
    'male' => 3,
    'female' => 3,
    'indeterminate' => 1,
  }.freeze

  attr_reader :choice

  def initialize(choice)
    @choice = choice
  end

  def indeterminate?
    choice == 'indeterminate'
  end

  def to_s
    choice
  end

  def self.choose_randomly
    sampling_array = WEIGHTED_OPTIONS.flat_map { |key, weight| Array.new(weight, key) }
    selection = sampling_array.sample
    self.new(selection)
  end

end

# puts Gender::WEIGHTED_OPTIONS.flat_map { |key, weight| Array.new(weight, key) }
# => ["male", "male", "male", "female", "female", "female", "indeterminate"]
