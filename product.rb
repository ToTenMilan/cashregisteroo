class Product
  attr_reader :name, :imported, :category, :price

  def initialize(name, imported, category, price)
    @name = name
    @imported = imported
    @category = category
    @price = price
  end
end
