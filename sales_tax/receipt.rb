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
		@shopping_cart.inject(0) { |sum, product| sum += product.tax }

	end


	def total_cost #what customer pays
	@shopping_cart.inject(0) { |sum, product| sum += product.total_for_item }
	end


	def output
		@shopping_cart.each do |product|
			puts "#{product.name} --> #{product.total_for_item}"
		end #end of each do
		puts "#{total_sales_tax}"
		puts "#{total_cost}"

	end #end of output method

end # end of Receipt class




###################################
#### Below is the Point Of Sale ###
###################################

### shopping_cart_1

book = Item.new("Book", 12.49, "no_tax")
cd = Item.new("CD", 14.99, "tax")
chocolate = Item.new("Chocolate Bar", 0.85, "no_tax")

shopping_cart_1 = Receipt.new
shopping_cart_1.add(book)
shopping_cart_1.add(cd)
shopping_cart_1.add(chocolate)

### shopping_cart_2

imp_chocolate = Item.new("Imported Chocolate", 10.50, "no_tax imported")
imp_perfume = Item.new("Imported Perfume", 54.65, "tax imported")

shopping_cart_2 = Receipt.new
shopping_cart_2.add(imp_chocolate)
shopping_cart_2.add(imp_perfume)



#####  Output  #####
puts "---shopping_cart_1---"
puts shopping_cart_1.output
puts "---shopping_cart_2---"
puts shopping_cart_2.output
