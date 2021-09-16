require_relative './lib/disguise'
require_relative './lib/height'

HORIZONTAL_RULE = "-" * 30

races_height_range = Race.determine_full_height_range
input_height_range = Range.new(races_height_range.min - 12, races_height_range.max + 12)
puts "Enter a height between #{input_height_range.min} and #{input_height_range.max}"

height_inches = 0
until height_inches.positive?
  puts "Enter your character's height in inches"
  height_inches = gets.chomp.to_i
  unless input_height_range.cover?(height_inches)
    puts "Enter a height between #{input_height_range.min} and #{input_height_range.max}"
    height_inches = 0 # force loop
  end
end

current_height = Height.new(height_inches)
min_height = Height.new(height_inches - 12)
max_height = Height.new(height_inches + 12)

puts HORIZONTAL_RULE
puts
puts "Your character is #{current_height} tall."
puts "The shortest they can appear is #{min_height.inches}\" (#{min_height})."
puts "The tallest they can appear is #{max_height.inches}\" (#{max_height})."
puts HORIZONTAL_RULE
puts

height_range = (min_height.inches)..(max_height.inches)
puts "You can appear as any of the following:"
puts Race.races_matching_height_range(height_range).map(&:name).join(', ')

disguise = Disguise.choose_randomly(height_range)
puts "You are disguised as #{disguise}."
puts HORIZONTAL_RULE
puts

possible_heights = disguise.race.height_range_overlap(height_range)
puts "Possible height: #{possible_heights.min}\" (#{Height.new(possible_heights.min)}) to #{possible_heights.max}\" (#{Height.new(possible_heights.max)})"
