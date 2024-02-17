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

  def price_with_taxes
    (price + sales_tax + import_tax).round(2)
  end

  def sales_tax
    return 0 if tax_exempt?
    calculate_tax_and_round(10)
  end

  def import_tax
    return 0 unless imported
    calculate_tax_and_round(5)
  end

  private

  def tax_exempt?
    ['book', 'food', 'medical'].include?(category)
  end

  def calculate_tax_and_round(tax_rate)
    # round up to the nearest 0.05
    raw_tax = (tax_rate * @price) / 100.0
    (raw_tax * 20).ceil / 20.0
  end
end
