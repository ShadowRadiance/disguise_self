class Race
  attr_accessor :name, :height_range, :tail, :wings, :horns, :tattooable,
                :hair_options, :skin_options, :fur_options, :scales_options, :feathers_options,
                :misc_options, :misc_item
  def initialize(
    name:, height_range:, tail: false, wings: false, horns: false, tattooable: true,
    hair:  [], skin: [], fur: [], scales: [], feathers: [], misc: [], misc_item: nil
  )
    @name = name
    @height_range = height_range

    @has_tail = tail
    @has_wings = wings
    @has_horns = horns
    @tattooable = tattooable

    @hair_options = hair
    @skin_options = skin
    @fur_options = fur
    @scales_options = scales
    @feathers_options = feathers
    @misc_options = misc
    @misc_item = misc_item

    Race.register(self)
  end

  def horns?; horns; end
  def wings?; wings; end
  def tail?; tail; end
  def tattooable?; tattooable; end

  def random_hair(gender: "indeterminate")
    if name == "Tabaxi" && gender == "male"
      # disallow Calico/Tortoiseshell if tabaxi is male
      choose_randomly(hair_options - ["Calico", "Tortoiseshell"])
    else
      choose_randomly(hair_options)
    end
  end

  def random_skin
    choose_randomly(skin_options)
  end

  def random_fur
    choose_randomly(fur_options)
  end

  def random_scales
    choose_randomly(scales_options)
  end

  def random_feathers
    choose_randomly(feathers_options)
  end

  def random_misc(gender: 'indeterminate')
    if name == "Leonin"
      mane_chance = case gender
      when 'male' then 1
      when 'indeterminate' then 0.5
      else 0
      end
      return nil unless (rand < mane_chance)
    end

    if name == "Tiefling"
      wing_chance = 0.25
      return nil unless (rand < wing_chance)
    end

    choose_randomly(misc_options)
  end

  def choose_randomly(options)
    options.sample
  end

  def to_s
    name
  end

  def height_range_overlaps?(other_range)
    height_range.max >= other_range.min && height_range.min <= other_range.max
  end

  def height_range_overlap(other_range)
    lo = [height_range.min, other_range.min].max
    hi = [height_range.max, other_range.max].min

    lo..hi
  end

  class << self
    def registry
      @registry ||= []
    end

    def register(race)
      registry << race
    end

    def choose_randomly(height_range=nil)
      races_matching_height_range(height_range).sample
    end

    def races_matching_height_range(height_range=nil)
      return registry if height_range.nil?

      registry.filter do |race|
        race.height_range_overlaps?(height_range)
      end
    end

    def determine_full_height_range
      registry.map(&:height_range).reduce { |memo, rng| range_expand(memo, rng) }
    end

    def range_expand(initial, addl)
      Range.new([initial.min, addl.min].min, [initial.max, addl.max].max)
    end
  end
end

# Races registered inline

Race.new(name: 'Aarokocra',
  height_range: 48..60,
  wings: true,
  tattooable: false,
  feathers: ['Bright Red', 'Dark Red', 'Burnt Red', 'Bright Orange', 'Dark Orange', 'Light Orange', 'Bright Yellow', 'Light Yellow', 'Light Brown', 'Dark Brown', 'Dark Grey', 'Light Grey', 'Pewter', 'Cloud Grey'],
)
Race.new(name: 'Aasimar',
  height_range: 60..78,
  hair: ['Strawberry Blonde', 'Scottish/Irish Red', 'Auburn', 'Platinum Blonde', 'Blonde', 'Dirty Blonde', 'Golden Brown', 'Caramel', 'Cocoa', 'Black', 'Bald'],
  skin: ['Light Brown', 'Dark Brown', 'Emerald Green', 'Silver', 'Gold', 'Copper'],
)
Race.new(name: 'Bugbear',
  height_range: 72..96,
  fur: ['Pale Yellow', 'Yellow', 'Dark Yellow', 'Light Orange', 'Orange', 'Dark Orange', 'Tawny', 'Strawberry Blonde', 'Scottish/Irish Red', 'Auburn'],
)
Race.new(name: 'Dragonborn',
  height_range: 72..84,
  tattooable: false,
  scales: ['Black', 'Blue', 'Brass', 'Bronze', 'Copper', 'Gold', 'Green', 'Red', 'Silver'],
)
Race.new(name: 'Dwarf',
  height_range: 46..56,
  hair: ['Strawberry Blonde', 'Scottish/Irish Red', 'Auburn', 'Platinum Blonde', 'Blonde', 'Dirty Blonde', 'Golden Brown', 'Caramel', 'Cocoa', 'Black', 'Bald'],
  skin: ['Alabaster', 'Pale Ivory', 'Ivory', 'Porcelain', 'Beige', 'Warm Beige', 'Honey', 'Golden', 'Tan', 'Olive', 'Taupe', 'Golden', 'Ebony', 'Bronze', 'Copper'],
)
Race.new(name: 'Wood Elf',
  height_range: 56..64,
  hair: ['Golden Brown', 'Caramel', 'Cocoa', 'Strawberry Blonde', 'Scottish/Irish Red', 'Auburn', 'Chestnut', 'Black'],
  skin: ['Alabaster', 'Pale Ivory', 'Ivory', 'Porcelain', 'Beige', 'Warm Beige', 'Honey', 'Golden', 'Tan', 'Olive', 'Taupe', 'Golden', 'Ebony', 'Bronze', 'Copper'],
)
Race.new(name: 'Half Wood Elf',
  height_range: 55..75,
  hair: ['Golden Brown', 'Caramel', 'Cocoa', 'Strawberry Blonde', 'Scottish/Irish Red', 'Auburn', 'Chestnut', 'Black'],
  skin: ['Alabaster', 'Pale Ivory', 'Ivory', 'Porcelain', 'Beige', 'Warm Beige', 'Honey', 'Golden', 'Tan', 'Olive', 'Taupe', 'Golden', 'Ebony', 'Bronze', 'Copper'],
)
Race.new(name: 'High Elf',
  height_range: 56..64,
  hair: ['White', 'Silver', 'Golden Blonde', 'Pale Yellow'],
  skin: ['Alabaster', 'Pale Ivory', 'Ivory', 'Porcelain', 'Beige', 'Warm Beige', 'Honey', 'Golden', 'Tan', 'Olive', 'Taupe', 'Golden', 'Ebony', 'Bronze', 'Copper'],
)
Race.new(name: 'Half High Elf',
  height_range: 55..75,
  hair: ['White', 'Silver', 'Golden Blonde', 'Pale Yellow'],
  skin: ['Alabaster', 'Pale Ivory', 'Ivory', 'Porcelain', 'Beige', 'Warm Beige', 'Honey', 'Golden', 'Tan', 'Olive', 'Taupe', 'Golden', 'Ebony', 'Bronze', 'Copper'],
)
Race.new(name: 'Pallid Elf',
  height_range: 56..64,
  hair: ['White', 'Silver', 'Golden Blonde', 'Pale Yellow'],
  skin: ['Alabaster', 'Pale Ivory', 'Ivory', 'Porcelain'],
)
Race.new(name: "Half Pallid Elf",
  height_range: 55..75,
  hair: ['White', 'Silver', 'Golden Blonde', 'Pale Yellow'],
  skin: ['Alabaster', 'Pale Ivory', 'Ivory', 'Porcelain'],
)
Race.new(name: 'Sea Elf',
  height_range: 56..64,
  hair: ['Seafoam Green', 'Black', 'Light Blue', 'Navy Blue', 'Cerulean', 'Bright Blue', 'Silver-White', 'Strawberry Blonde', 'Scottish/Irish Red', 'Auburn', 'Teal', 'Turquoise', 'Kelly Green'],
  skin: ['Dark Green', 'Teal', 'Turquoise', 'Silver', 'Indigo', 'Cobalt Blue', 'Cerulean', 'Sapphire Blue', 'Baby Blue', 'Sky Blue', 'Aqua'],
)
Race.new(name: 'Half Sea Elf',
  height_range: 55..75,
  hair: ['Seafoam Green', 'Black', 'Light Blue', 'Navy Blue', 'Cerulean', 'Bright Blue', 'Silver-White', 'Strawberry Blonde', 'Scottish/Irish Red', 'Auburn', 'Teal', 'Turquoise', 'Kelly Green', 'Strawberry Blonde', 'Scottish/Irish Red', 'Auburn', 'Platinum Blonde', 'Blonde', 'Dirty Blonde', 'Golden Brown', 'Caramel', 'Cocoa', 'Black', 'Bald'],
  skin: ['Dark Green', 'Teal', 'Turquoise', 'Silver', 'Indigo', 'Cobalt Blue', 'Cerulean', 'Sapphire Blue', 'Baby Blue', 'Sky Blue', 'Aqua'],
)
Race.new(name: 'Shadar-kai Elf',
  height_range: 56..64,
  hair: ['Black', 'Grey', 'Silver', 'White'],
  skin: ['Dark Grey', 'Light Grey', 'Pewter', 'Cloud Grey'],
)
Race.new(name: 'Half Shadar-kai Elf',
  height_range: 55..75,
  hair: ['Black', 'Grey', 'Silver', 'White'],
  skin: ['Dark Grey', 'Light Grey', 'Pewter', 'Cloud Grey'],
)
Race.new(name: 'Eladrin',
  height_range: 65..73,
  hair: ['Strawberry Blonde', 'Scottish/Irish Red', 'Golden Blonde', 'White', 'Silver', 'Black'],
  skin: ['Alabaster', 'Pale Ivory', 'Ivory', 'Porcelain', 'Beige', 'Warm Beige', 'Honey', 'Golden', 'Tan', 'Olive', 'Taupe', 'Golden', 'Ebony', 'Bronze', 'Copper'],
)
Race.new(name: 'Half Eladrin',
  height_range: 64..75,
  hair: ['Strawberry Blonde', 'Scottish/Irish Red', 'Golden Blonde', 'White', 'Silver', 'Black'],
  skin: ['Alabaster', 'Pale Ivory', 'Ivory', 'Porcelain', 'Beige', 'Warm Beige', 'Honey', 'Golden', 'Tan', 'Olive', 'Taupe', 'Golden', 'Ebony', 'Bronze', 'Copper'],
)
Race.new(name: 'Drow',
  height_range: 55..65,
  hair: ['Obsidian', 'Dark Grey', 'Charcoal', 'Dark Blue'],
  skin: ['White', 'Silver', 'Pale Yellow', 'Black'],
)
Race.new(name: 'Half Drow',
  height_range: 54..66,
  hair: ['Dark Grey', 'Light Grey', 'Pewter', 'Cloud Grey'],
  skin: ['White', 'Silver', 'Pale Yellow', 'Black'],
)
Race.new(name: 'Firbolg',
  height_range: 84..96,
  hair: ['Platinum Blonde', 'Blonde', 'Dirty Blonde', 'Golden Brown', 'Caramel', 'Cocoa', 'Strawberry Blonde', 'Scottish/Irish Red', 'Auburn', 'Chestnut', 'Black', 'Silver', 'White'],
  skin: ['Dark Grey', 'Light Grey', 'Pewter', 'Cloud Grey', 'Light Pink'],
)
Race.new(name: 'Water Genasi',
  height_range: 60..78,
  hair: ['Baby Blue', 'Cornflower Blue', 'Light Blue', 'Pale Turquoise', 'Sky Blue'],
  skin: ['Light Blue', 'Pale Turquoise', 'Sky Blue', 'Baby Blue', 'Seafoam Green'],
)
Race.new(name: 'Air Genasi',
  height_range: 60..78,
  hair: ['Light Blue', 'Pale Turquoise', 'Sky Blue', 'Baby Blue', 'Seafoam Green', 'Bald'],
  skin: ['Baby Blue', 'Cornflower Blue', 'Light Blue', 'Pale Turquoise', 'Sky Blue'],
)
Race.new(name: 'Fire Genasi',
  height_range: 60..78,
  hair: ['fire'],
  skin: ['Bright Red', 'Burnt Orange', 'Charcoal', 'Ash Grey'],
)
Race.new(name: 'Earth Genasi',
  height_range: 60..78,
  skin: ['Deep Brown', 'Light Brown', 'Green Agate', 'Yellow Agate', 'Red Agate', 'Obsidian', 'Rusted Iron', 'Matte Silver', 'Matte Gold', 'Matte Copper', 'Polished Silver', 'Polished Gold', 'Polished Copper'],
)
Race.new(name: 'Gith',
  height_range: 61..72,
  hair: ['Black', 'Dark Grey', 'Light Grey', 'Scottish/Irish Red', 'Auburn', 'Chestnut'],
  skin: ['Yellow Green', 'Pale Green', 'Moss Green', 'Olive Green', 'Dark Green', 'Light Brown', 'Green Brown'],
)
Race.new(name: 'Gnome',
  height_range: 36..48,
  hair: ['Strawberry Blonde', 'Scottish/Irish Red', 'Auburn', 'Platinum Blonde', 'Blonde', 'Dirty Blonde', 'Golden Brown', 'Caramel', 'Cocoa', 'Black', 'Bald', 'Pink', 'Green', 'Blue', 'Purple', 'Orange'],
  skin: ['Honey', 'Golden', 'Tan', 'Olive', 'Taupe', 'Golden', 'Ebony', 'Bronze', 'Copper', 'Dark Grey', 'Light Grey', 'Pewter', 'Cloud Grey'],
)
Race.new(name: 'Goblin',
  height_range: 36..48,
  hair: ['Cocoa', 'Chestnut', 'Black'],
  skin: ['Dark Red', 'Umber', 'Bronze', 'Light Orange', 'Orange', 'Dark Orange', 'Burnt Orange', 'Rust', 'Dark Yellow', 'Yellow'],
)
Race.new(name: 'Goliath',
  height_range: 84..96,
  hair: ['Cocoa', 'Chestnut', 'Black'],
  skin: ['Dark Grey', 'Light Grey', 'Pewter', 'Cloud Grey', 'Light Brown', 'Dark Brown'],
)
Race.new(name: 'Half Orc',
  height_range: 60..78,
  hair: ['Black', 'Grey'],
  skin: ['Dark Grey', 'Light Grey', 'Pewter', 'Cloud Grey', 'Light Green', 'Dark Green', 'Bright Green'],
)
Race.new(name: 'Halfling',
  height_range: 33..39,
  hair: ['Black', 'Golden Brown', 'Caramel', 'Cocoa', 'Chestnut', 'Grey', 'Silver', 'White', 'Dirty Blonde'],
  skin: ['Alabaster', 'Pale Ivory', 'Ivory', 'Porcelain', 'Beige', 'Warm Beige', 'Honey', 'Golden', 'Tan', 'Olive', 'Taupe', 'Golden', 'Ebony', 'Bronze', 'Copper'],
)
Race.new(name: 'Hobgoblin',
  height_range: 48..64,
  hair: ['Dark Brown', 'Dark Grey', 'Orange', 'Red'],
  skin: ['Dark Red', 'Umber', 'Bronze', 'Dark Orange', 'Burnt Orange', 'Rust'],
)
Race.new(name: 'Human',
  height_range: 58..72,
  hair: ['Strawberry Blonde', 'Scottish/Irish Red', 'Auburn', 'Platinum Blonde', 'Blonde', 'Dirty Blonde', 'Golden Brown', 'Caramel', 'Cocoa', 'Black', 'Bald'],
  skin: ['Alabaster', 'Pale Ivory', 'Ivory', 'Porcelain', 'Beige', 'Warm Beige', 'Honey', 'Golden', 'Tan', 'Olive', 'Taupe', 'Golden', 'Ebony', 'Bronze', 'Copper'],
)
Race.new(name: 'Kalashtar',
  height_range: 62..78,
  hair: ['Strawberry Blonde', 'Scottish/Irish Red', 'Auburn', 'Platinum Blonde', 'Blonde', 'Dirty Blonde', 'Golden Brown', 'Caramel', 'Cocoa', 'Black', 'Bald'],
  skin: ['Alabaster', 'Pale Ivory', 'Ivory', 'Porcelain', 'Beige', 'Warm Beige', 'Honey', 'Golden', 'Tan', 'Olive', 'Taupe', 'Golden', 'Ebony', 'Bronze', 'Copper'],
)
Race.new(name: 'Kenku',
  height_range: 53..72,
  wings: true,
  tattooable: false,
  feathers: ['Black', 'Dark Brown', 'Russet'],
)
Race.new(name: 'Kobold',
  height_range: 84..96,
  tail: true,
  tattooable: false,
  scales: ['Dark Red', 'Umber', 'Bronze', 'Light Orange', 'Orange', 'Dark Orange', 'Burnt Orange', 'Rust', 'Light Brown', 'Dark Brown'],
)
Race.new(name: 'Leonin',
  height_range: 71..85,
  tail: true,
  tattooable: false,
  fur: ['Tawny', 'Golden', 'Black', 'White', 'Dark Brown'],
  misc: ['Tawny', 'Golden', 'Black', 'White', 'Dark Brown'],
  misc_item: "a %{misc_item} mane"
)
Race.new(name: 'Lizardfolk',
  height_range: 57..79,
  tail: true,
  tattooable: false,
  scales: ['Light Green', 'Dark Green', 'Bright Green', 'Black', 'Light Brown', 'Dark Brown', 'Yellow', 'Orange', 'Light Grey', 'Dark Grey'],
  misc: ['Light Green', 'Dark Green', 'Bright Green', 'Black', 'Light Brown', 'Dark Brown', 'Yellow', 'Orange', 'Light Grey', 'Dark Grey'],
  misc_item: "a %{misc_item} head crest"
)
Race.new(name: "Orc",
  height_range: 67..77,
  hair: ['Black', 'Grey'],
  skin: ['Dark Grey', 'Light Grey', 'Pewter', 'Cloud Grey'],
)
Race.new(name: "Eberron Orc",
  height_range: 63..81,
  hair: ['Black', 'Grey'],
  skin: ['Dark Grey', 'Light Grey', 'Pewter', 'Cloud Grey'],
)
Race.new(name: 'Owlfolk',
  height_range: 72..96,
  wings: true,
  tattooable: false,
  feathers: ['Tawny', 'Light Brown', 'Dark Brown', 'Tawny', 'Light Brown', 'Dark Brown', 'Tawny', 'Light Brown', 'Dark Brown', 'Black', 'Black', 'White'],
)
Race.new(name: 'Rabbitfolk',
  height_range: 46..77,
  tail: true,
  tattooable: false,
  fur: ['Sandy', 'White', 'Black', 'Dark Grey', 'Light Grey', 'Steel Grey'],
)
Race.new(name: 'Satyr',
  height_range: 60..72,
  tail: true,
  horns: true,
  hair: ['Dirty Blonde', 'Strawberry Blonde', 'Scottish/Irish Red', 'Auburn', 'Chestnut', 'Black', 'Golden Brown', 'Caramel', 'Cocoa'],
  skin: ['Alabaster', 'Pale Ivory', 'Ivory', 'Porcelain', 'Beige', 'Warm Beige', 'Honey', 'Golden', 'Tan', 'Olive', 'Taupe', 'Golden', 'Ebony', 'Bronze', 'Copper'],
  fur: ['Dirty Blonde', 'Strawberry Blonde', 'Scottish/Irish Red', 'Auburn', 'Chestnut', 'Black', 'Golden Brown', 'Caramel', 'Cocoa'],
)
Race.new(name: 'Simic Hybric',
  height_range: 72..96,
  hair: ['Strawberry Blonde', 'Scottish/Irish Red', 'Auburn', 'Platinum Blonde', 'Blonde', 'Dirty Blonde', 'Golden Brown', 'Caramel', 'Cocoa', 'Black', 'Bald'],
  skin: ['Alabaster', 'Pale Ivory', 'Ivory', 'Porcelain', 'Beige', 'Warm Beige', 'Honey', 'Golden', 'Tan', 'Olive', 'Taupe', 'Golden', 'Ebony', 'Bronze', 'Copper'],
)
Race.new(name: 'Tabaxi',
  height_range: 61..75,
  tail: true,
  tattooable: false,
  fur: ['Burnt Red', 'Light Orange', 'Orange', 'Dark Orange', 'Burnt Orange', 'Rust', 'Dark Yellow', 'Yellow', 'Light Yellow', 'Calico', 'Tortoiseshell'],
)
Race.new(name: 'Tiefling',
  height_range: 57..79,
  tail: true,
  wings: true,
  horns: true,
  hair: ['Golden Brown', 'Caramel', 'Cocoa', 'Strawberry Blonde', 'Scottish/Irish Red', 'Auburn', 'Chestnut', 'Black', 'Navy Blue', 'Neon Purple', 'Plum'],
  skin: ['Red', 'Maroon', 'Orange', 'Bronze', 'Yellow', 'Yellow Green', 'Obsidian', 'Dark Grey', 'Light Grey', 'Pewter', 'Cloud Grey'],
  misc: ['Red', 'Maroon', 'Orange', 'Bronze', 'Yellow', 'Yellow Green', 'Obsidian', 'Dark Grey', 'Light Grey', 'Pewter', 'Cloud Grey'],
  misc_item: "%{misc_item} wings"
)

Race.new(name: 'Tortle',
  height_range: 60..72,
  tail: true,
  tattooable: false,
  scales: ['Yellow Green', 'Pale Green', 'Moss Green', 'Olive Green', 'Dark Green', 'Light Brown', 'Green Brown', 'Dark Teal', 'Deep Turquoise'],
  misc: ['Yellow Green', 'Pale Green', 'Moss Green', 'Olive Green', 'Dark Green', 'Light Brown', 'Green Brown', 'Dark Teal', 'Deep Turquoise'],
  misc_item: "a %{misc_item} shell"
)
Race.new(name: 'Triton',
  height_range: 58..72,
  hair: ['Light Green', 'Dark Green', 'Bright Green', 'Navy Blue', 'Light Blue', 'Pale Turquoise', 'Sky Blue', 'Baby Blue', 'Seafoam Green', 'Teal'],
  skin: ['Baby Blue', 'Cornflower Blue', 'Light Blue', 'Pale Turquoise', 'Sky Blue', 'Silver Blue'],
)
Race.new(name: 'Vedalken',
  height_range: 64..72,
  skin: ['Baby Blue', 'Cornflower Blue', 'Light Blue', 'Pale Turquoise', 'Sky Blue', 'Silver Blue', 'Dark Blue', 'Dark Blue Grey', 'Light Blue Grey', 'White Blue', 'Cloud Grey'],
)
Race.new(name: 'Verdan',
  height_range: 73..79,
  hair: ['Jade Green', 'Dark Green', 'Light Green', 'Kelly Green', 'Emerald Green', 'Moss Green', 'Black', 'White', 'Bald'],
  skin: ['Yellow Green', 'Pale Green', 'Moss Green', 'Olive Green', 'Dark Green', 'Green Brown'],
)
Race.new(name: 'Yuan-ti Pureblood',
  height_range: 60..74,
  hair: ['Black', 'Dark Green', 'Dark Blue'],
  skin: ['Pale Green'],
)


# 1/4 tiefling have wings and use w-tiefling, others use tiefling
