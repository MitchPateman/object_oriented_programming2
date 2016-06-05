class Item
	attr_accessor :name, :price, :product_type, :tax

	def initialize(name, price, product_type)
		@name = name
		@price = price
		@product_type = product_type
		@tax = tax
	end


	def tax
		if @product_type == "no_tax"
				 0
		elsif @product_type == "no_tax imported"
				@price * 0.05
		elsif @product_type == "tax"
				@price * 0.10
		elsif @product_type == "tax imported"
				@price * 0.15
		end
	end


	def total_for_item
		@price + tax
	end


end #End of Item class
