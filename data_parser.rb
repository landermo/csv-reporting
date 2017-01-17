# How much money did we make this week?
# How much of a bonus did each employee get? (bonuses are paid to employees who pilot the Planet Express)
# How many trips did each employee pilot?
# How much money did we make broken down by planet? ie.. how much did we make shipping to Earth? Mars? Saturn? etc.
#     Different employees have favorite destinations they always pilot to
#
# Fry - pilots to Earth (because he isn't allowed into space)
# Amy - pilots to Mars (so she can visit her family)
# Bender - pilots to Uranus (teeheee...)
# Leela - pilots everywhere else because she is the only responsible one


require 'csv'
revenue = 0
bonus_per_person = {'Fry' => 0, 'Amy' => 0, 'Bender' => 0, 'Leela' => 0}
destination_counts = {'Earth' => 0, 'Moon' => 0, 'Mars' => 0, 'Uranus' => 0, 'Jupiter' => 0, 'Pluto' => 0, 'Saturn' => 0, 'Mercury' => 0}

def pilot_for_planet(planet)
 if planet == 'Earth'
    'Fry'
   if planet == 'Uranus'
       'Bender'
       if planet == 'Mars'
         'Amy'
         else
          'Leela'
         end
     end
   end
 end


CSV.foreach('/Users/lmontgomery/RubymineProjects/csv-reporting/planet_express_logs.csv', headers: true) do |row|
  # puts row.inspect

  money_this_week = row['Crates'].to_f * row['Money'].to_f
  bonus = money_this_week * 0.05
  puts "Money this week: #{money_this_week} Bonus: #{bonus}"
  revenue += money_this_week



  planet = row['Destination']
  current_count = destination_counts[planet]
  new_count = current_count + 1
  destination_counts[planet] = new_count

end
puts ' '
puts "Total revenue is #{revenue}"
puts "Destination counts #{destination_counts}"






