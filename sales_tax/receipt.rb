require_relative "item"

class Receipt
attr_accessor :item

	def initialize
		@shopping_cart = []
	end

	def add(item)
		@shopping_cart << item
	end


	def total_sales_tax #add up taxes on each item in shopping_cart array
		total_sales_tax = @shopping_cart.map { |n| n.tax }
		total_sales_tax.inject{:+}

	end


	def total_cost #what customer pays
		total_cost = @shopping_cart.map { |n| n.total_for_item }
		total_cost.inject{:+}
	end


	def output
		@shopping_cart.each do |product|
			puts "#{product.name} --> #{product.total_for_item}"
		end #end of each do
		puts "Total Sales Tax: #{total_sales_tax}"
		puts "Total Cost: #{total_cost}"

	end #end of output method

end # end of Receipt class

#shopping_cart_1
book = Item.new("Book", 12.49, "no_tax")
cd = Item.new("CD", 14.99, "tax")
chocolate = Item.new("Chocolate Bar", 0.85, "no_tax")

shopping_cart_1 = Receipt.new
shopping_cart_1.add(book)
shopping_cart_1.add(cd)
shopping_cart_1.add(chocolate)

shopping_cart_1.output
