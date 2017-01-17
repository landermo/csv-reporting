# How much money did we make this week?
# How much of a bonus did each employee get? (bonuses are paid to employees who pilot the Planet Express)
# How many trips did each employee pilot?
# How much money did we make broken down by planet? ie.. how much did we make shipping to Earth? Mars? Saturn? etc.
# Different employees have favorite destinations they always pilot to
#
# Fry - pilots to Earth (because he isn't allowed into space)
# Amy - pilots to Mars (so she can visit her family)
# Bender - pilots to Uranus (teeheee...)
# Leela - pilots everywhere else because she is the only responsible one


require 'csv'
require 'tempfile'

def pilot_per_planet(planet)
  if planet == 'Earth'
    'Fry'
  elsif planet == 'Mars'
    'Amy'
    elsif planet == 'Uranus'
    'Bender'
  else planet
    'Leela'
    end
  end


revenue = Hash.new(0)
revenue_per_pilot = Hash.new(0)
bonus_per_pilot = Hash.new(0)
destination_counts = Hash.new(0)

CSV.foreach('/Users/lmontgomery/RubymineProjects/csv-reporting/planet_express_logs.csv', headers: true) do |row|
  # puts row.inspect

  planet = row['Destination']
  money_this_week = row['Crates'].to_i * row['Money'].to_i
  bonus = money_this_week * 0.05
  current_count = destination_counts[planet]
  new_count = current_count + 1
  destination_counts[planet] = new_count

  pilot = pilot_per_planet(planet)
  revenue_per_pilot[pilot] += money_this_week
  revenue[planet] += money_this_week
  bonus_per_pilot[pilot] += bonus

end


puts "Bonus per pilot: #{bonus_per_pilot}"
puts "Revenue per pilot: #{revenue_per_pilot}"
puts "Total revenue is #{revenue}"
puts "Destination counts #{destination_counts}"


