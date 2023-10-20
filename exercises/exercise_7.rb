require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...
class Store < ActiveRecord::Base
  has_many :employees
  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { greater_than_or_equal_to: 0 }
  validate :carry_apparel

  def carry_apparel
    errors.add(:base, "Stores must carry at least one of the men's or women's apparel") unless mens_apparel || womens_apparel
  end
end

class Employee < ActiveRecord::Base
  belongs_to :store
  validates :first_name, :last_name, presence: true
  validates :hourly_rate, numericality: { only_integer: true, greater_than_or_equal_to: 40, less_than_or_equal_to: 200 }
  validates :store, presence: true
end

# Ask the user for a store name
print "Enter a store name: "
store_name = gets.chomp

# Attempt to create a store with the inputted name
new_store = Store.create(name: store_name)

# Display the error messages provided back from ActiveRecord
if new_store.errors.any?
  new_store.errors.full_messages.each do |message|
    puts message
  end
else
  puts "Store created successfully!"
end