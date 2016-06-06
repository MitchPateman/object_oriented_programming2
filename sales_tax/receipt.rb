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
		@shopping_cart.inject(0) { |sum, n| sum += n.tax }

	end


	def total_cost #what customer pays
	@shopping_cart.inject(0) { |sum, n| sum += n.total_for_item }
	end


	def output
		@shopping_cart.each do |product|
			puts "#{product.name} --> #{product.total_for_item.round(2)}"
		end #end of each do
		puts "Total Sales Tax:  #{total_sales_tax.round(2)}"
		puts "Total Cost:  #{total_cost.round(2)}"

	end #end of output method

end # end of Receipt class




###################################
#### Below is the INPUT / Output ###
###################################


#INPUT#

### shopping_cart_1
book = Item.new("Book", 12.49, "no_tax")
cd = Item.new("CD", 14.99, "tax")
chocolate = Item.new("Chocolate Bar", 0.85, "no_tax")

shopping_cart_1 = Receipt.new
shopping_cart_1.add(book)
shopping_cart_1.add(cd)
shopping_cart_1.add(chocolate)


### shopping_cart_2
imp_chocolate = Item.new("Imported Chocolate", 10.00, "no_tax_imported")
imp_perfume = Item.new("Imported Perfume", 47.50, "tax_imported")

shopping_cart_2 = Receipt.new
shopping_cart_2.add(imp_chocolate)
shopping_cart_2.add(imp_perfume)


### shopping_cart_3
imp_perfume = Item.new("Imported Perfume", 27.99, "tax_imported")
perfume = Item.new("Perfume", 18.99, "tax")
headache_pills = Item.new("Headache Pills", 9.75, "no_tax")
imp_chocolate = Item.new("Imported Chocolate", 11.25, "no_tax_imported")

shopping_cart_3 = Receipt.new
shopping_cart_3.add(imp_perfume)
shopping_cart_3.add(perfume)
shopping_cart_3.add(headache_pills)
shopping_cart_3.add(imp_chocolate)



#####  Output  #####
puts "---------------------------------"
puts "---Shopping Cart 1---"
puts "---------------------------------"
puts "PRODUCT --> PRICE (with Tax)"
puts shopping_cart_1.output

puts "---------------------------------"
puts "---Shopping Cart 2---"
puts "---------------------------------"
puts "PRODUCT --> PRICE (with Tax)"
puts shopping_cart_2.output

puts "---------------------------------"
puts "---Shopping Cart 3---"
puts "---------------------------------"
puts "PRODUCT --> PRICE (with Tax)"
puts shopping_cart_3.output
