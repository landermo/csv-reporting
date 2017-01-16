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

CSV.foreach('/Users/lmontgomery/RubymineProjects/csv-reporting/planet_express_logs.csv', headers: true) do |row|
  # puts row.inspect

  money_this_week = row['Crates'].to_f * row['Money'].to_f
  bonus = money_this_week * 0.05
  puts "Money this week: #{money_this_week} Bonus: #{bonus}"
  revenue += money_this_week

end

puts "Total revenue is #{revenue}"







