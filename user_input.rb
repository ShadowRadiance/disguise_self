def Feet(number)
  number.to_i / 12
end
def Inches(number)
  number.to_i % 12
end

puts "Enter your character's height in inches"
charinches = gets.chomp

puts "Your character is #{ Feet(charinches) } feet, #{ Inches(charinches) } inches tall"
