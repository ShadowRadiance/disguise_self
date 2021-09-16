require_relative './height'
require_relative './race'
require_relative './gender'
require_relative './age'
require_relative './horns'
require_relative './tattoo'
require_relative './scar'

class Disguise
  attr_reader :race, :gender, :age_category, :horns, :tattoo, :scar, :hair, :skin, :fur, :scales, :feathers, :misc

  def initialize(
    race:,
    gender:,
    age_category:,
    horns:,
    tattoo:,
    scar:,
    hair:,
    skin:,
    fur:,
    scales:,
    feathers:,
    misc:
  )
    @race = race
    @gender = gender
    @age_category = age_category
    @horns = horns
    @tattoo = tattoo
    @scar = scar
    @hair = hair
    @skin = skin
    @fur = fur
    @scales = scales
    @feathers = feathers
    @misc = misc
  end

  def self.choose_randomly(height_range=nil)
    race = Race.choose_randomly(height_range)
    # race = Race.registry.filter { |r| r.name=="Tiefling" }.first
    gender = Gender.choose_randomly
    new(
      race: race,
      gender: gender,
      age_category: AgeCategory.choose_randomly,
      horns: race.horns? ? Horn.choose_randomly : nil,
      tattoo: race.tattooable? ? Tattoo.choose_randomly : nil,
      scar: Scar.choose_randomly,
      hair: race.random_hair,
      skin: race.random_skin,
      fur: race.random_fur,
      scales: race.random_scales,
      feathers: race.random_feathers,
      misc: race.random_misc(gender: gender),
    )
  end

  def to_s
    hair_s = hair && "#{hair} hair"
    skin_s = skin && "#{skin} skin"
    fur_s = fur && "#{fur} fur"
    scales_s = scales && "#{scales} scales"
    feathers_s = feathers && "#{feathers} feathers"
    misc_s = misc && sprintf(race.misc_item, misc_item: misc)
    coverings = english_list([hair_s, skin_s, fur_s, scales_s, feathers_s, misc_s].compact)
    other = english_list([horns, tattoo, scar].compact)

    [
      age_category,
      gender.indeterminate? ? "#{race.name} of indeterminate gender" : "#{gender} #{race.name}",
      ("with #{coverings}#{"." if other}" if coverings),
      ("You also have #{other}" if other)
    ].compact.join(" ")
  end

  def english_list(array)
    case array.length
    when 0 then nil
    when 1 then array.first
    when 2 then array.join(" and ")
    else "#{array[0..-2].join(", ")}, and #{array[-1]}"
    end
  end
end
