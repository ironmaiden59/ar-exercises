require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'

puts "Exercise 5"
puts "----------"

# Your code goes here ...
# Output the total revenue for all stores
total_revenue = Store.sum(:annual_revenue)
puts "Total Revenue: #{total_revenue}"

# Output the average annual revenue for all stores
average_revenue = Store.average(:annual_revenue)
puts "Average Revenue: #{average_revenue}"

# Output the number of stores generating $1M or more in annual sales
high_earning_stores_count = Store.where('annual_revenue >= ?', 1000000).count
puts "Number of High Earning Stores: #{high_earning_stores_count}"