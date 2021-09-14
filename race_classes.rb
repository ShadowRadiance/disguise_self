# Determine Gender
gender_array = ['male', 'female', 'male', 'female','male', 'female', 'indeterminate']
$genderpick = gender_array.shuffle.first

age_array = ['young', 'teenaged', 'adult', 'middle-aged', 'teen', 'adult', 'middle-aged', 'teen', 'adult', 'middle-aged', 'old', 'elderly']
$agepick = age_array.shuffle.first
if $age_pick == 'adult' || $age_pick == 'old' || $age_pick == 'elderly'
  $age_description = "an #{ $agepick } "
else
  $age_description = "a #{ $agepick } "
end

horn_length = ['tiny', 'short', 'medium', 'long', 'very long']
horn_twist = ['straight', 'wavy', 'twisted']
horn_color = ['black', 'light grey', 'white', 'dark grey', 'light brown']
$horn_description = "#{ horn_length.shuffle.first }, #{ horn_twist.shuffle.first } #{ horn_color.shuffle.first } horns "

$randtattoo = rand(1...4)

$has_tattoo = false
if $randtattoo == 1
  $has_tattoo = true
  $tattoo_size = ['small', 'medium-sized', 'large', 'massive']
  $tattoo_array = ['wildcat', 'band of barbed wire', 'flower', 'scorpion', 'sword', 'axe', 'dagger', 'wand', 'fireball']
  $tattoo_location = ['back', 'forearm', 'bicep', 'calf', 'thigh', 'chest']
  $tattoo_description = "a #{ $tattoo_size.shuffle.first } tattoo of " +
  if $tattoo_array.shuffle.first == 'axe'
    "an #{ $tattoo_array.shuffle.first } on your #{ $tattoo_location.shuffle.first }"
  else
    "a #{ $tattoo_array.shuffle.first } on your #{ $tattoo_location.shuffle.first }"
  end
end

$randscar = rand(1...10)

$has_scar = false
if $randscar == 1
  $has_scar = true
  $scar_size = ['small', 'medium-sized', 'large', 'massive']
  $scar_array = ['keiloid', 'burn', 'intentional scarification', 'surgical', 'jagged']
  $scar_location = ['back', 'forearm', 'bicep', 'calf', 'thigh', 'chest']
  $scar_description = "a #{ $scar_size.shuffle.first } #{ $scar_array.shuffle.first } " +
  if $scar_array.shuffle.first == 'intentional scarification'
    "on your #{ $scar_location.shuffle.first }"
  else
    "scar on your #{ $scar_location.shuffle.first }"
  end
end

class Race
  attr_accessor :racename, :minheight, :maxheight, :hastail, :haswings, :hashair, :hasskin, :hasfur, :hasscales, :hasfeathers, :hashorns, :hasmisc, :cantattoo, :hairarray, :skinarray, :furarray, :scalearray, :featherarray, :miscarray
  def initialize(racename, minheight, maxheight, hastail, haswings, hashair, hasskin, hasfur, hasscales, hasfeathers, hashorns, hasmisc, cantattoo, hairarray, skinarray, furarray, scalearray, featherarray, miscarray)
    @race_name = racename
    @minheight = minheight
    @maxheight = maxheight
    @hastail = hastail
    @haswings = haswings
    @hashair = hashair
    @hasskin = hasskin
    @hasfur = hasfur
    @hasscales = hasscales
    @hasfeathers = hasfeathers
    @hashorns = hashorns
    @hasmisc = hasmisc
    @cantattoo = cantattoo
    @hairarray = hairarray
    @skinarray = skinarray
    @furarray = furarray
    @scalearray = scalearray
    @featherarray = featherarray
    @miscarray = miscarray
  end

  def to_s
    # vowel_first = false
    # if @race_name.split(//).first.downcase == "a" || @race_name.split(//).first.downcase == "e" || @race_name.split(//).first.downcase == "i" || @race_name.split(//).first.downcase == "o" || @race_name.split(//).first.downcase == "u"
    #   vowel_first = true
    # end
    print "You are disguised as #{ $age_description }"
    if $genderpick == 'male' || $genderpick == 'female'
      print "#{ $genderpick } #{ @race_name } "
    else
      print "#{ @race_name } of indeterminate gender "
    end
    print "with "
    if @hashair == true
      print "#{ @hairarray.shuffle.first.downcase } hair "
    end
    if @hasskin == true
      print "#{ @skinarray.shuffle.first.downcase } skin "
    end
    if @hasfur == true
      print "#{ @furarray.shuffle.first.downcase } fur "
    end
    if @hasscales == true
      print "#{ @scalearray.shuffle.first.downcase } scales "
    end
    if @hasfeathers == true
      print "#{ @featherarray.shuffle.first.downcase } feathers "
    end
    if @hasmisc== true
      print "and "
      if @race_name == "Tortle"
        print "a #{ @miscarray.shuffle.first.downcase } shell"
      elsif @race_name == "Lizardfolk"
        print "a #{ @miscarray.shuffle.first.downcase } head crest"
      elsif @race_name == "Warforged"
        print "#{ @miscarray.shuffle.first.downcase } plating"
      elsif @race_name == "Leonin"
        if $genderpick == 'male'
          print "a #{ @miscarray.shuffle.first.downcase } mane"
        elsif $genderpick == 'indeterminate'
          coin_flip = rand(1...2)
          if coin_flip == 1
            print "a #{ @miscarray.shuffle.first.downcase } mane"
          end
        else
          print "no mane"
        end
      elsif @race_name == 'Tiefling'
        print "#{ @miscarray.shuffle.first.downcase } wings"
      end
    end
    print "."
    if @hashorns || $has_tattoo || $has_scar
      puts
      print "With "
      if @hashorns
        print $horn_description
      end
      if $has_tattoo
        print $tattoo_description
      end
      if $has_scar
        print $scar_description
      end
    end
  end
end

aarokocra = Race.new('Aarokocra', 48, 60, false, true, false, false, false, false, true, false, false, false, [], [], [], [], ['Bright Red', 'Dark Red', 'Burnt Red', 'Bright Orange', 'Dark Orange', 'Light Orange', 'Bright Yellow', 'Light Yellow', 'Light Brown', 'Dark Brown', 'Dark Grey', 'Light Grey', 'Pewter', 'Cloud Grey'], [])

aasimar = Race.new('Aasimar', 60, 78, false, false, true, true, false, false, false, false, false, true, ['Strawberry Blonde', 'Scottish/Irish Red', 'Auburn', 'Platinum Blonde', 'Blonde', 'Dirty Blonde', 'Golden Brown', 'Caramel', 'Cocoa', 'Black', 'Bald'], ['Light Brown', 'Dark Brown', 'Emerald Green', 'Silver', 'Gold', 'Copper'], [], [], [], [])

bugbear = Race.new('Bugbear', 72, 96, false, false, false, false, true, false, false, false, false, true, [], [], ['Pale Yellow', 'Yellow', 'Dark Yellow', 'Light Orange', 'Orange', 'Dark Orange', 'Tawny', 'Strawberry Blonde', 'Scottish/Irish Red', 'Auburn'], [], [], [])

dragonborn = Race.new('Dragonborn', 72, 84, false, false, false, false, false, true, false, false, false, false, [], [], [], ['Black', 'Blue', 'Brass', 'Bronze', 'Copper', 'Gold', 'Green', 'Red', 'Silver'], [], [])

dwarf = Race.new('Dwarf', 46, 56, false, false, true, true, false, false, false, false, false, true, ['Strawberry Blonde', 'Scottish/Irish Red', 'Auburn', 'Platinum Blonde', 'Blonde', 'Dirty Blonde', 'Golden Brown', 'Caramel', 'Cocoa', 'Black', 'Bald'], ['Alabaster', 'Pale Ivory', 'Ivory', 'Porcelain', 'Beige', 'Warm Beige', 'Honey', 'Golden', 'Tan', 'Olive', 'Taupe', 'Golden', 'Ebony', 'Bronze', 'Copper'], [], [], [], [])

woodelf = Race.new('Wood Elf', 56, 64, false, false, true, true, false, false, false, false, false, true, ['Golden Brown', 'Caramel', 'Cocoa', 'Strawberry Blonde', 'Scottish/Irish Red', 'Auburn', 'Chestnut', 'Black'
], ['Alabaster', 'Pale Ivory', 'Ivory', 'Porcelain', 'Beige', 'Warm Beige', 'Honey', 'Golden', 'Tan', 'Olive', 'Taupe', 'Golden', 'Ebony', 'Bronze', 'Copper'], [], [], [], [])

halfwoodelf = Race.new('Half Wood Elf', 55, 75, false, false, true, true, false, false, false, false, false, true, ['Golden Brown', 'Caramel', 'Cocoa', 'Strawberry Blonde', 'Scottish/Irish Red', 'Auburn', 'Chestnut', 'Black'
], ['Alabaster', 'Pale Ivory', 'Ivory', 'Porcelain', 'Beige', 'Warm Beige', 'Honey', 'Golden', 'Tan', 'Olive', 'Taupe', 'Golden', 'Ebony', 'Bronze', 'Copper'], [], [], [], [])

highelf = Race.new('High Elf', 56, 64, false, false, true, true, false, false, false, false, false, true, ['White', 'Silver', 'Golden Blonde', 'Pale Yellow'], ['Alabaster', 'Pale Ivory', 'Ivory', 'Porcelain', 'Beige', 'Warm Beige', 'Honey', 'Golden', 'Tan', 'Olive', 'Taupe', 'Golden', 'Ebony', 'Bronze', 'Copper'], [], [], [], [])

halfhighelf = Race.new('Half High Elf', 55, 75, false, false, true, true, false, false, false, false, false, true, ['White', 'Silver', 'Golden Blonde', 'Pale Yellow'], ['Alabaster', 'Pale Ivory', 'Ivory', 'Porcelain', 'Beige', 'Warm Beige', 'Honey', 'Golden', 'Tan', 'Olive', 'Taupe', 'Golden', 'Ebony', 'Bronze', 'Copper'], [], [], [], [])

pallidelf = Race.new('Pallid Elf', 56, 64, false, false, true, true, false, false, false, false, false, true, ['White', 'Silver', 'Golden Blonde', 'Pale Yellow'], ['Alabaster', 'Pale Ivory', 'Ivory', 'Porcelain'], [], [], [], [])

halfpallidelf = Race.new("Half Pallid Elf", 55, 75, false, false, true, true, false, false, false, false, false, true, ['White', 'Silver', 'Golden Blonde', 'Pale Yellow'], ['Alabaster', 'Pale Ivory', 'Ivory', 'Porcelain'], [], [], [], [])

seaelf = Race.new('Sea Elf', 56, 64, false, false, true, true, false, false, false, false, false, true, ['Seafoam Green', 'Black', 'Light Blue', 'Navy Blue', 'Cerulean', 'Bright Blue', 'Silver-White', 'Strawberry Blonde', 'Scottish/Irish Red', 'Auburn', 'Teal', 'Turquoise', 'Kelly Green'], ['Dark Green', 'Teal', 'Turquoise', 'Silver', 'Indigo', 'Cobalt Blue', 'Cerulean', 'Sapphire Blue', 'Baby Blue', 'Sky Blue', 'Aqua'], [], [], [], [])

halfseaelf = Race.new('Half Sea Elf', 55, 75, false, false, true, true, false, false, false, false, false, true, ['Seafoam Green', 'Black', 'Light Blue', 'Navy Blue', 'Cerulean', 'Bright Blue', 'Silver-White', 'Strawberry Blonde', 'Scottish/Irish Red', 'Auburn', 'Teal', 'Turquoise', 'Kelly Green', 'Strawberry Blonde', 'Scottish/Irish Red', 'Auburn', 'Platinum Blonde', 'Blonde', 'Dirty Blonde', 'Golden Brown', 'Caramel', 'Cocoa', 'Black', 'Bald'], ['Dark Green', 'Teal', 'Turquoise', 'Silver', 'Indigo', 'Cobalt Blue', 'Cerulean', 'Sapphire Blue', 'Baby Blue', 'Sky Blue', 'Aqua'], [], [], [], [])

shadarkai = Race.new('Shadar-kai Elf', 56, 64, false, false, true, true, false, false, false, false, false, true, ['Black', 'Grey', 'Silver', 'White'], ['Dark Grey', 'Light Grey', 'Pewter', 'Cloud Grey'], [], [], [], [])

halfshadarkai = Race.new('Half Shadar-kai Elf', 55, 75, false, false, true, true, false, false, false, false, false, true, ['Black', 'Grey', 'Silver', 'White'], ['Dark Grey', 'Light Grey', 'Pewter', 'Cloud Grey'], [], [], [], [])

eladrin = Race.new('Eladrin', 65, 73, false, false, true, true, false, false, false, false, false, true, ['Strawberry Blonde', 'Scottish/Irish Red', 'Golden Blonde', 'White', 'Silver', 'Black'], ['Alabaster', 'Pale Ivory', 'Ivory', 'Porcelain', 'Beige', 'Warm Beige', 'Honey', 'Golden', 'Tan', 'Olive', 'Taupe', 'Golden', 'Ebony', 'Bronze', 'Copper'], [], [], [], [])

halfeladrin = Race.new('Half Eladrin', 64, 75, false, false, true, true, false, false, false, false, false, true, ['Strawberry Blonde', 'Scottish/Irish Red', 'Golden Blonde', 'White', 'Silver', 'Black'], ['Alabaster', 'Pale Ivory', 'Ivory', 'Porcelain', 'Beige', 'Warm Beige', 'Honey', 'Golden', 'Tan', 'Olive', 'Taupe', 'Golden', 'Ebony', 'Bronze', 'Copper'], [], [], [], [])

drow = Race.new('Drow', 55, 65, false, false, true, true, false, false, false, false, false, true, ['Obsidian', 'Dark Grey', 'Charcoal', 'Dark Blue'], ['White', 'Silver', 'Pale Yellow', 'Black'], [], [], [], [])

halfdrow = Race.new('Half Drow', 54, 66, false, false, true, true, false, false, false, false, false, true, ['Dark Grey', 'Light Grey', 'Pewter', 'Cloud Grey'], ['White', 'Silver', 'Pale Yellow', 'Black'], [], [], [], [])

firbolg = Race.new('Firbolg', 84, 96, false, false, true, true, false, false, false, false, false, true, ['Platinum Blonde', 'Blonde', 'Dirty Blonde', 'Golden Brown', 'Caramel', 'Cocoa', 'Strawberry Blonde', 'Scottish/Irish Red', 'Auburn', 'Chestnut', 'Black', 'Silver', 'White'], ['Dark Grey', 'Light Grey', 'Pewter', 'Cloud Grey', 'Light Pink'], [], [], [], [])

wgenasi = Race.new('Water Genasi', 60, 78, false, false, true, true, false, false, false, false, false, true, ['Baby Blue', 'Cornflower Blue', 'Light Blue', 'Pale Turquoise', 'Sky Blue'], ['Light Blue', 'Pale Turquoise', 'Sky Blue', 'Baby Blue', 'Seafoam Green'], [], [], [], [])

agenasi = Race.new('Air Genasi', 60, 78, false, false, true, true, false, false, false, false, false, true, ['Light Blue', 'Pale Turquoise', 'Sky Blue', 'Baby Blue', 'Seafoam Green', 'Bald'], ['Baby Blue', 'Cornflower Blue', 'Light Blue', 'Pale Turquoise', 'Sky Blue'], [], [], [], [])

fgenasi = Race.new('Fire Genasi', 60, 78, false, false, true, true, false, false, false, false, false, true, ['fire'], ['Bright Red', 'Burnt Orange', 'Charcoal', 'Ash Grey'], [], [], [], [])

egenasi = Race.new('Earth Genasi', 60, 78, false, false, false, true, false, false, false, false, false, true, [], ['Deep Brown', 'Light Brown', 'Green Agate', 'Yellow Agate', 'Red Agate', 'Obsidian', 'Rusted Iron', 'Matte Silver', 'Matte Gold', 'Matte Copper', 'Polished Silver', 'Polished Gold', 'Polished Copper'], [], [], [], [])

gith = Race.new('Gith', 61, 72, false, false, true, true, false, false, false, false, false, true, ['Black', 'Dark Grey', 'Light Grey', 'Scottish/Irish Red', 'Auburn', 'Chestnut'], ['Yellow Green', 'Pale Green', 'Moss Green', 'Olive Green', 'Dark Green', 'Light Brown', 'Green Brown'], [], [], [], [])

gnome = Race.new('Gnome', 36, 48, false, false, true, true, false, false, false, false, false, true, ['Strawberry Blonde', 'Scottish/Irish Red', 'Auburn', 'Platinum Blonde', 'Blonde', 'Dirty Blonde', 'Golden Brown', 'Caramel', 'Cocoa', 'Black', 'Bald', 'Pink', 'Green', 'Blue', 'Purple', 'Orange'], ['Honey', 'Golden', 'Tan', 'Olive', 'Taupe', 'Golden', 'Ebony', 'Bronze', 'Copper', 'Dark Grey', 'Light Grey', 'Pewter', 'Cloud Grey'], [], [], [], [])

goblin = Race.new('Goblin', 36, 48, false, false, true, true, false, false, false, false, false, true, ['Cocoa', 'Chestnut', 'Black'], ['Dark Red', 'Umber', 'Bronze', 'Light Orange', 'Orange', 'Dark Orange', 'Burnt Orange', 'Rust', 'Dark Yellow', 'Yellow'], [], [], [], [])

goliath = Race.new('Goliath', 84, 96, false, false, true, true, false, false, false, false, false, true, ['Cocoa', 'Chestnut', 'Black'], ['Dark Grey', 'Light Grey', 'Pewter', 'Cloud Grey', 'Light Brown', 'Dark Brown'], [], [], [], [])

halforc = Race.new('Half Orc', 60, 78, false, false, true, true, false, false, false, false, false, true, ['Black', 'Grey'], ['Dark Grey', 'Light Grey', 'Pewter', 'Cloud Grey', 'Light Green', 'Dark Green', 'Bright Green'], [], [], [], [])

halfling = Race.new('Halfling', 33, 39, false, false, true, true, false, false, false, false, false, true, ['Black', 'Golden Brown', 'Caramel', 'Cocoa', 'Chestnut', 'Grey', 'Silver', 'White', 'Dirty Blonde'], ['Alabaster', 'Pale Ivory', 'Ivory', 'Porcelain', 'Beige', 'Warm Beige', 'Honey', 'Golden', 'Tan', 'Olive', 'Taupe', 'Golden', 'Ebony', 'Bronze', 'Copper'], [], [], [], [])

hobgoblin = Race.new('Hobgoblin', 48, 64, false, false, true, true, false, false, false, false, false, true, ['Dark Brown', 'Dark Grey', 'Orange', 'Red'], ['Dark Red', 'Umber', 'Bronze', 'Dark Orange', 'Burnt Orange', 'Rust'], [], [], [], [])

human = Race.new('Human', 58, 72, false, false, true, false, true, false, false, false, false, true, ['Strawberry Blonde', 'Scottish/Irish Red', 'Auburn', 'Platinum Blonde', 'Blonde', 'Dirty Blonde', 'Golden Brown', 'Caramel', 'Cocoa', 'Black', 'Bald'], ['Alabaster', 'Pale Ivory', 'Ivory', 'Porcelain', 'Beige', 'Warm Beige', 'Honey', 'Golden', 'Tan', 'Olive', 'Taupe', 'Golden', 'Ebony', 'Bronze', 'Copper'], [], [], [], [])

kalashtar = Race.new('Kalashtar', 62, 78, false, false, true, true, false, false, false, false, false, true, ['Strawberry Blonde', 'Scottish/Irish Red', 'Auburn', 'Platinum Blonde', 'Blonde', 'Dirty Blonde', 'Golden Brown', 'Caramel', 'Cocoa', 'Black', 'Bald'], ['Alabaster', 'Pale Ivory', 'Ivory', 'Porcelain', 'Beige', 'Warm Beige', 'Honey', 'Golden', 'Tan', 'Olive', 'Taupe', 'Golden', 'Ebony', 'Bronze', 'Copper'], [], [], [], [])

kenku = Race.new('Kenku', 53, 72, false, true, false, false, false, false, true, false, false, false, [], [], [], [], ['Black', 'Dark Brown', 'Russet'], [])

kobold = Race.new('Kobold', 84, 96, true, false, false, false, false, true, false, false, false, false, [], [], [], ['Dark Red', 'Umber', 'Bronze', 'Light Orange', 'Orange', 'Dark Orange', 'Burnt Orange', 'Rust', 'Light Brown', 'Dark Brown'], [], [])

leonin = Race.new('Leonin', 71, 85, true, false, false, false, true, false, false, false, true, false, [], [], ['Tawny', 'Golden', 'Black', 'White', 'Dark Brown'], [], [], ['Tawny', 'Golden', 'Black', 'White', 'Dark Brown'])

lizardfolk = Race.new('Lizardfolk', 57, 79, true, false, false, false, false, true, false, false, true, false, [], [], [], ['Light Green', 'Dark Green', 'Bright Green', 'Black', 'Light Brown', 'Dark Brown', 'Yellow', 'Orange', 'Light Grey', 'Dark Grey'], [], ['Light Green', 'Dark Green', 'Bright Green', 'Black', 'Light Brown', 'Dark Brown', 'Yellow', 'Orange', 'Light Grey', 'Dark Grey'])

orc = Race.new("Orc", 67, 77, false, false, true, true, false, false, false, false, false, true, ['Black', 'Grey'], ['Dark Grey', 'Light Grey', 'Pewter', 'Cloud Grey'], [], [], [], [])

eorc = Race.new("Eberron Orc", 63, 81, false, false, true, true, false, false, false, false, false, true, ['Black', 'Grey'], ['Dark Grey', 'Light Grey', 'Pewter', 'Cloud Grey'], [], [], [], [])

owlfolk = Race.new('Owlfolk', 72, 96, false, true, false, false, false, false, true, false, false, false, [], [], [], [], ['Tawny', 'Light Brown', 'Dark Brown', 'Tawny', 'Light Brown', 'Dark Brown', 'Tawny', 'Light Brown', 'Dark Brown', 'Black', 'Black', 'White'], [])

rabbitfolk = Race.new('Rabbitfolk', 46, 77, true, false, false, false, true, false, false, false, false, false, [], [], ['Sandy', 'White', 'Black', 'Dark Grey', 'Light Grey', 'Steel Grey'], [], [], [])

satyr = Race.new('Satyr', 60, 72, true, false, true, true, true, false, false, true, false, true, ['Dirty Blonde', 'Strawberry Blonde', 'Scottish/Irish Red', 'Auburn', 'Chestnut', 'Black', 'Golden Brown', 'Caramel', 'Cocoa'], ['Alabaster', 'Pale Ivory', 'Ivory', 'Porcelain', 'Beige', 'Warm Beige', 'Honey', 'Golden', 'Tan', 'Olive', 'Taupe', 'Golden', 'Ebony', 'Bronze', 'Copper'], ['Dirty Blonde', 'Strawberry Blonde', 'Scottish/Irish Red', 'Auburn', 'Chestnut', 'Black', 'Golden Brown', 'Caramel', 'Cocoa'], [], [], [])

simic = Race.new('Simic Hybric', 72, 96, false, false, true, true, false, false, false, false, false, true, ['Strawberry Blonde', 'Scottish/Irish Red', 'Auburn', 'Platinum Blonde', 'Blonde', 'Dirty Blonde', 'Golden Brown', 'Caramel', 'Cocoa', 'Black', 'Bald'], ['Alabaster', 'Pale Ivory', 'Ivory', 'Porcelain', 'Beige', 'Warm Beige', 'Honey', 'Golden', 'Tan', 'Olive', 'Taupe', 'Golden', 'Ebony', 'Bronze', 'Copper'], [], [], [], [])

if $genderpick != 'male'
  tabaxi = Race.new('Tabaxi', 61, 75, true, false, false, false, true, false, false, false, false, false, [], [], ['Burnt Red', 'Light Orange', 'Orange', 'Dark Orange', 'Burnt Orange', 'Rust', 'Dark Yellow', 'Yellow', 'Light Yellow', 'Calico', 'Tortoiseshell'], [], [], [])
else
  tabaxi = Race.new('Tabaxi', 61, 75, true, false, false, false, true, false, false, false, false, false, [], [], ['Burnt Red', 'Light Orange', 'Orange', 'Dark Orange', 'Burnt Orange', 'Rust', 'Dark Yellow', 'Yellow', 'Light Yellow'], [], [], [])
end

twings = rand(1...4)
if twings == 1
  tiefling = Race.new('Tiefling', 57, 79, true, true, true, true, false, false, false, true, true, true, ['Golden Brown', 'Caramel', 'Cocoa', 'Strawberry Blonde', 'Scottish/Irish Red', 'Auburn', 'Chestnut', 'Black', 'Navy Blue', 'Neon Purple', 'Plum'], ['Red', 'Maroon', 'Orange', 'Bronze', 'Yellow', 'Yellow Green', 'Obsidian', 'Dark Grey', 'Light Grey', 'Pewter', 'Cloud Grey'], [], [], [], ['Red', 'Maroon', 'Orange', 'Bronze', 'Yellow', 'Yellow Green', 'Obsidian', 'Dark Grey', 'Light Grey', 'Pewter', 'Cloud Grey'])
else
  tiefling = Race.new('Tiefling', 57, 79, true, false, true, true, false, false, false, true, false, true, ['Golden Brown', 'Caramel', 'Cocoa', 'Strawberry Blonde', 'Scottish/Irish Red', 'Auburn', 'Chestnut', 'Black', 'Navy Blue', 'Neon Purple', 'Plum'], ['Red', 'Maroon', 'Orange', 'Bronze', 'Yellow', 'Yellow Green', 'Obsidian', 'Dark Grey', 'Light Grey', 'Pewter', 'Cloud Grey'], [], [], [], [])
end

tortle = Race.new('Tortle', 60, 72, true, false, false, false, false, true, false, false, true, false, [], [], [], ['Yellow Green', 'Pale Green', 'Moss Green', 'Olive Green', 'Dark Green', 'Light Brown', 'Green Brown', 'Dark Teal', 'Deep Turquoise'], [], ['Yellow Green', 'Pale Green', 'Moss Green', 'Olive Green', 'Dark Green', 'Light Brown', 'Green Brown', 'Dark Teal', 'Deep Turquoise'])

triton = Race.new('Triton', 58, 72, false, false, true, true, false, false, false, false, false, true, ['Light Green', 'Dark Green', 'Bright Green', 'Navy Blue', 'Light Blue', 'Pale Turquoise', 'Sky Blue', 'Baby Blue', 'Seafoam Green', 'Teal'], ['Baby Blue', 'Cornflower Blue', 'Light Blue', 'Pale Turquoise', 'Sky Blue', 'Silver Blue'], [], [], [], [])

vedalken = Race.new('Vedalken', 64, 72, false, false, false, true, false, false, false, false, false, true, [], ['Baby Blue', 'Cornflower Blue', 'Light Blue', 'Pale Turquoise', 'Sky Blue', 'Silver Blue', 'Dark Blue', 'Dark Blue Grey', 'Light Blue Grey', 'White Blue', 'Cloud Grey'], [], [], [], [])

verdan = Race.new('Verdan', 73, 79, false, false, true, true, false, false, false, false, false, true, ['Jade Green', 'Dark Green', 'Light Green', 'Kelly Green', 'Emerald Green', 'Moss Green', 'Black', 'White', 'Bald'], ['Yellow Green', 'Pale Green', 'Moss Green', 'Olive Green', 'Dark Green', 'Green Brown'], [], [], [], [])

yuanti = Race.new('Yuan-ti Pureblood', 60, 74, false, false, true, true, false, false, false, false, false, true, ['Black', 'Dark Green', 'Dark Blue'], ['Pale Green'], [], [], [], [])
