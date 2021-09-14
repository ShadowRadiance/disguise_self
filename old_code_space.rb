# Removed to create array instead of giant readout
def race_check (charmax, charmin, list_of_races)
  list_of_races.each do |race_record|
    if charmax < race_record[:minheight] || charmin > race_record[:maxheight]
    else
      if charmax > race_record[:maxheight] && charmin < race_record[:minheight]
        puts "#{ race_record[:name] } (Max Height: #{ Feet(race_record[:maxheight]) } feet #{ Inches(race_record[:maxheight]) } inches, Min Height: #{ Feet(race_record[:minheight]) } feet #{ Inches(race_record[:minheight]) } inches) "
      elsif charmax > race_record[:maxheight]
        puts "#{ race_record[:name] } (Max Height: #{ Feet(race_record[:maxheight]) } feet #{ Inches(race_record[:maxheight]) } inches), "
      elsif charmin < race_record[:minheight]
        puts "#{ race_record[:name] } (Min Height: #{ Feet(race_record[:minheight]) } feet #{ Inches(race_record[:minheight]) } inches), "
      else
        puts "#{ race_record[:name] } "
      end
    end
  end
end
