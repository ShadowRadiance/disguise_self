class AgeCategory

  WEIGHTED_OPTIONS = {
    "young" => 1,
    "teen" => 3,
    "adult" => 3,
    "middle aged" => 3,
    "old" => 1,
    "elderly" => 1,
  }.freeze

  attr_reader :choice

  def initialize(choice)
    @choice = choice
  end

  def to_s
    case choice
    when "adult", "old", "elderly"
      "an #{choice}"
    else
      "a #{choice}"
    end
  end

  def self.choose_randomly
    sampling_array = WEIGHTED_OPTIONS.flat_map { |key, weight| Array.new(weight, key) }
    selection = sampling_array.sample
    self.new(selection)
  end

end
