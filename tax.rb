class Product
  
  attr_accessor :price, :quantity, :name

  def initialize(price, quantity, name)
    @price = price
    @quantity = quantity
    @name = name
  end

  def taxes
    0.10
  end

  def sales_tax
    @price * taxes
  end

  def total
    @price + sales_tax
  end

  def to_s
    "#{@quantity} #{@name} : #{@price}"
  end
end

class ExemptProduct < Product
  def taxes 
    0
  end 
end

class ImportedProduct < Product
  def taxes
    @price * 0.15
  end
end

class ImportedExemptProduct < Product
  def taxes
    @price * 0.05
  end
end

class Maths 
  def initialize(*products)
    @total_taxes = 0
    #@total = 0
    products.each do |p|
      @total_taxes += p.taxes
      #@total += p.total
    end
    puts "Sales Taxes: #{@total_taxes}"
    #puts "Total: #{@total}"
  end
end


class Basket 

  def initialize
    @shoplist = []
  end

  def add_product(product)
    @shoplist << product
  end

  def to_s
    result = ""
    @shoplist.each do |item|
      result << item.to_s + "\n"
    end
    result
  end
end

basket1 = Basket.new
prod1 = ExemptProduct.new(12.49, 1, "book")
basket1.add_product(prod1)
prod2 = Product.new(14.99, 1, "music CD")
basket1.add_product(prod2)
prod3 = ExemptProduct.new(0.85, 1, "chocolate bar")
basket1.add_product(prod3)
puts basket1
saletax1 = Maths.new(prod1,prod2,prod3)


basket2 = Basket.new
prod4 = ImportedExemptProduct.new(10.00, 1, "imported box of chocolates")
basket2.add_product(prod4)
prod5 = ImportedProduct.new(47.50, 1, "imported bottle of perfume")
basket2.add_product(prod5)
puts basket2
saletax2 = Maths.new(prod4, prod5)

basket3 = Basket.new
prod6 = ImportedProduct.new(27.99, 1, "imported bottle of perfume")
basket3.add_product(prod6)
prod7 = Product.new(18.99, 1, "bottle of perfume")
basket3.add_product(prod7)
prod8 = ExemptProduct.new(9.75, 1, "packet of headache pills")
basket3.add_product(prod8)
prod9 = ImportedExemptProduct.new(11.25, 1, "box of imported chocolates")
basket3.add_product(prod9)
puts basket3
saletax3 = Maths.new(prod6, prod7, prod8, prod9)



