class Product
  attr_reader :name, :imported, :category, :price

  def initialize(name, imported, category, price)
    @name = name
    @imported = imported
    @category = category
    @price = price
  end

  def price_with_sales_tax
    price + sales_tax
  end

  def sales_tax
    return 0 if tax_exempt?
    (price * 0.10)
  end

  def import_tax
    return 0 unless imported
    (price * 0.05)
  end

  def tax_exempt?
    ['book', 'food', 'medical'].include?(category)
  end
end
