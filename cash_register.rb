# Problem Statement
# This problem requires some kind of input. You are free to implement any mechanism for feeding the input into your solution.
# You should provide sufficient evidence that your solution is complete by, as a minimum, indicating that it works correctly against the supplied test data.
#   Basic sales tax is applicable at a rate of 10% on all goods, except:
#     books, food, and medical products that are exempt.
#   Import duty is an additional sales tax applicable on all imported goods at a rate of 5%, with no exemptions.

# When I purchase items I receive a receipt which lists the name of all the items and their price (including tax),
# finishing with the total cost of the items, and the total amounts of sales taxes paid. The rounding rules for sales tax
# are that for a tax rate of n%, a shelf price of p contains (np/100 rounded up to the nearest 0.05) amount of sales tax.

# Write an application that prints out the receipt details for these shopping baskets:

# Input (You will be graded against these and more, please make sure these work)

# Product
# imported: boolean
# category: [book, food, medical, other]

# CashRegister
# products

require_relative 'product'

class CashRegister
  def initialize(products)
    @products = products
  end

  def products
    @products
  end

  def total
    @products.map(&:price).reduce(:+)
  end

  def sales_tax
    @products.map(&:sales_tax).reduce(:+)
  end

  def import_tax
    @products.map(&:import_tax).reduce(:+)
  end

  def total_tax
    (sales_tax + import_tax).round(2)
  end

  def total_with_tax
    (total + total_tax).round(2)
  end

  def result
    {
      products: map_products,
      sales_taxes: total_tax,
      total: total_with_tax
    }
  end

  private

  def map_products
    @products.group_by(&:name).map do |name, products|
      {
        name: name,
        price: products.map(&:price_with_taxes).reduce(:+).round(2),
        amount: products.size
      }
    end

  end
end
