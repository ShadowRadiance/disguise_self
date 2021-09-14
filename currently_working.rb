races = [
  { name: "Aasimar", minheight: 60, maxheight: 78 },
  { name: "Bugbear", minheight: 72, maxheight: 96 },
  { name: "Dragonborn", minheight: 72, maxheight: 84 },
  { name: "Dwarf", minheight: 46, maxheight: 56 },
  { name: "Elf", minheight: 56, maxheight: 74 },
  { name: "Eladrin", minheight: 65, maxheight: 73 },
  { name: "Drow", minheight: 55, maxheight: 65 },
  { name: "Firbolg", minheight: 84, maxheight: 96 },
  { name: "Genasi", minheight: 60, maxheight: 78 },
  { name: "Gith", minheight: 61, maxheight: 72 },
  { name: "Gnome", minheight: 36, maxheight: 48 },
  { name: "Goblin", minheight: 36, maxheight: 48 },
  { name: "Goliath", minheight: 84, maxheight: 96 },
  { name: "Half Elf", minheight: 55, maxheight: 75 },
  { name: "Half Eladrin", minheight: 64, maxheight: 75 },
  { name: "Half Drow", minheight: 54, maxheight: 66 },
  { name: "Half Orc", minheight: 60, maxheight: 78 },
  { name: "Halfling", minheight: 33, maxheight: 39 },
  { name: "Hobgoblin", minheight: 48, maxheight: 64 },
  { name: "Human", minheight: 58, maxheight: 72 },
  { name: "Kalashtar", minheight: 62, maxheight: 78 },
  { name: "Kenku", minheight: 53, maxheight: 71 },
  { name: "Kobold", minheight: 84, maxheight: 96 },
  { name: "Leonin", minheight: 71, maxheight: 85 },
  { name: "Lizardfolk", minheight: 57, maxheight: 79 },
  { name: "Orc", minheight: 67, maxheight: 77 },
  { name: "Eberron Orc", minheight: 63, maxheight: 81 },
  { name: "Owlfolk", minheight: 72, maxheight: 96 },
  { name: "Rabbitfolk", minheight: 46, maxheight: 77 },
  { name: "Satyr", minheight: 60, maxheight: 72 },
  { name: "Simic Hybrid", minheight: 72, maxheight: 96 },
  { name: "Tabaxi", minheight: 61, maxheight: 75 },
  { name: "Tiefling", minheight: 57, maxheight: 79 },
  { name: "Tortle", minheight: 60, maxheight: 72 },
  { name: "Triton", minheight: 58, maxheight: 72 },
  { name: "Vedalken", minheight: 64, maxheight: 86 },
  { name: "Verdan", minheight: 73, maxheight: 79 },
  { name: "YuanTi", minheight: 60, maxheight: 74 }
]

def Feet(number)
  number.to_i / 12
end
def Inches(number)
  number.to_i % 12
end

def race_check (charmax, charmin, list_of_races)
  $selected_races = []
  list_of_races.each do |race_record|
    if charmax < race_record[:minheight] || charmin > race_record[:maxheight]
    else
      new_race = {name: race_record[:name], minheight: race_record[:minheight], maxheight: race_record[:maxheight]}
      $selected_races.push(new_race)
    end
  end
end

puts "Enter your character's height in inches"
charinches = gets.chomp
charmax = charinches.to_i + 12
charmin = charinches.to_i - 12
30.times { print "-" }
puts
puts "Your character is #{ Feet(charinches) } feet, #{ Inches(charinches) } inches tall."
puts "The shortest they can appear is #{ charmin } inches (#{ Feet(charmin) } feet, #{ Inches(charmin) } inches)."
puts "The tallest they can appear is #{ charmax } inches (#{ Feet(charmax) } feet, #{ Inches(charmax) } inches)."
30.times { print "-" }
puts
puts "You are Disguised as:"
30.times { print "-" }
puts
race_list = race_check(charmax, charmin, races)
# print $selected_races
picked_race = Array($selected_races.sample(1))
print picked_race
puts