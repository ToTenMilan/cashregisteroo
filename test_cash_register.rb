require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'product'

describe CashRegister do
  it 'returns products and all the data' do
    products = [
      Product.new( 'book', false, 'book', 12.49 ),
      Product.new( 'book', false, 'book', 12.49 ),
      Product.new( 'music cd', false, 'other', 14.99 ),
      Product.new( 'chocolate bar', false, 'food', 0.85 )
    ]
    cash_register = CashRegister.new(products)
    assert_equal cash_register.products, products
  end

  it 'calculate total for single non-exempt sales tax product' do
    products = [
      Product.new( 'music cd', false, 'other', 14.99 )
    ]
    cash_register = CashRegister.new(products)
    assert_equal cash_register.sales_tax, 1.499
  end

  it 'calcaultes total for single exempt sales tax product' do
    products = [
      Product.new( 'book', false, 'book', 12.49 )
    ]
    cash_register = CashRegister.new(products)
    assert_equal cash_register.sales_tax, 0
  end

  it 'calculates total for single imported product' do
    products = [
      Product.new( 'imported box of chocolates', true, 'food', 10.00 )
    ]
    cash_register = CashRegister.new(products)
    assert_equal cash_register.import_tax, 0.5
  end

  it 'calculates total for multiple imported products' do
    products = [
      Product.new( 'imported box of chocolates', true, 'food', 10.00 ),
      Product.new( 'imported bottle of perfume', true, 'other', 47.50 )
    ]
    cash_register = CashRegister.new(products)
    assert_equal cash_register.import_tax, 2.875
  end

  it 'calculates total tax for single product' do
    products = [
      Product.new( 'imported bottle of perfume', true, 'other', 47.50 )
    ]
    cash_register = CashRegister.new(products)
    assert_equal cash_register.total_tax, 7.125
  end

  describe 'acceptance tests' do
    # Input 1:
    # 2 book at 12.49
    # 1 music CD at 14.99
    # 1 chocolate bar at 0.85
    # Output 1:
    # 2 book: 24.98
    # 1 music CD: 16.49
    # 1 chocolate bar: 0.85
    # Sales Taxes: 1.50
    # Total: 42.32
    it 'calculates total for input 1' do
      products = [
        Product.new( 'book', false, 'book', 12.49 ),
        Product.new( 'book', false, 'book', 12.49 ),
        Product.new( 'music cd', false, 'other', 14.99 ),
        Product.new( 'chocolate bar', false, 'food', 0.85 )
      ]
      cash_register = CashRegister.new(products)
      assert_equal cash_register.total_with_tax, 42.32
    end

    it 'calculates total tax for input 1' do
      products = [
        Product.new( 'book', false, 'book', 12.49 ),
        Product.new( 'book', false, 'book', 12.49 ),
        Product.new( 'music cd', false, 'other', 14.99 ),
        Product.new( 'chocolate bar', false, 'food', 0.85 )
      ]
      cash_register = CashRegister.new(products)
      assert_equal cash_register.total_tax, 1.499
    end

  end
end
