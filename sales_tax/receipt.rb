require_relative "item"

class Receipt
attr_accessor :item

	def initialize
		@shopping_cart = []
	end

	def add(item)
		@shopping_cart << item
	end


	def total_sales_tax #add up taxes on each item
		@shopping_cart.map.inject { |sum, e| sum + e.tax }
	end


	def total_cost #what customer pays
		@shopping_cart.map.inject { |sum, e| sum + e.total_for_item }
	end


	def output
		@shopping_cart.each do |product|
			puts "#{product.name} --> #{product.total_for_item}"
		end #end of each do
		puts "Total Sales Tax: #{total_sales_tax}"
		puts "Total Cost: #{total_cost}"

	end #end of output method

end # end of Receipt class
