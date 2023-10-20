require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

# Your code goes here ...
# Define the one-to-many association
class Store < ActiveRecord::Base
  has_many :employees
end

class Employee < ActiveRecord::Base
  belongs_to :store
end

# Create employees for Store 1 (Burnaby)
@store1.employees.create(first_name: "Khurram", last_name: "Virani", hourly_rate: 60)
@store1.employees.create(first_name: "John", last_name: "Doe", hourly_rate: 50)
@store1.employees.create(first_name: "Jane", last_name: "Doe", hourly_rate: 55)

# Create employees for Store 2 (Richmond)
@store2.employees.create(first_name: "Michael", last_name: "Scott", hourly_rate: 45)
@store2.employees.create(first_name: "Dwight", last_name: "Schrute", hourly_rate: 40)
@store2.employees.create(first_name: "Jim", last_name: "Halpert", hourly_rate: 50)