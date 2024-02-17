require 'pry'
require 'pry-byebug'
require 'byebug'
require 'pry-nav'

class Product
  attr_reader :name, :imported, :category, :price

  def initialize(name, imported, category, price)
    @name = name
    @imported = imported
    @category = category
    @price = price
  end

  def price_with_sales_tax
    (price + sales_tax).round(2)
  end

  def price_with_taxes
    (price + sales_tax + import_tax).round(2)
  end

  def sales_tax
    return 0 if tax_exempt?
    raw_tax = (10 * @price) / 100.0
    (raw_tax * 20).round / 20.0
  end

  def import_tax
    return 0 unless imported
    raw_tax = (5 * @price) / 100.0
    (raw_tax * 20).round / 20.0
  end

  def tax_exempt?
    ['book', 'food', 'medical'].include?(category)
  end
end
