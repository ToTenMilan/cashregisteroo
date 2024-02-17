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
    assert_equal products, cash_register.products
  end

  it 'calculate total for single non-exempt sales tax product' do
    products = [
      Product.new( 'music cd', false, 'other', 14.99 )
    ]
    cash_register = CashRegister.new(products)
    assert_equal 1.5, cash_register.sales_tax
  end

  it 'calcaultes total for single exempt sales tax product' do
    products = [
      Product.new( 'book', false, 'book', 12.49 )
    ]
    cash_register = CashRegister.new(products)
    assert_equal 0, cash_register.sales_tax
  end

  it 'calculates total for single imported product' do
    products = [
      Product.new( 'imported box of chocolates', true, 'food', 10.00 )
    ]
    cash_register = CashRegister.new(products)
    assert_equal 0.5, cash_register.import_tax
  end

  it 'calculates total for multiple imported products' do
    products = [
      Product.new( 'imported box of chocolates', true, 'food', 10.00 ),
      Product.new( 'imported bottle of perfume', true, 'other', 47.50 )
    ]
    cash_register = CashRegister.new(products)
    assert_equal cash_register.import_tax, 2.9
  end

  it 'calculates total tax for single product' do
    products = [
      Product.new( 'imported bottle of perfume', true, 'other', 47.50 )
    ]
    cash_register = CashRegister.new(products)
    assert_equal 7.15, cash_register.total_tax
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
      assert_equal 42.32, cash_register.total_with_tax
    end

    it 'calculates total sales tax for input 1' do
      products = [
        Product.new( 'book', false, 'book', 12.49 ),
        Product.new( 'book', false, 'book', 12.49 ),
        Product.new( 'music cd', false, 'other', 14.99 ),
        Product.new( 'chocolate bar', false, 'food', 0.85 )
      ]
      cash_register = CashRegister.new(products)
      assert_equal 1.50, cash_register.sales_tax
    end

    # Input 2:
    # 1 imported box of chocolates at 10.00
    # 1 imported bottle of perfume at 47.50
    # Output 2:
    # 1 imported box of chocolates: 10.50
    # 1 imported bottle of perfume: 54.65
    # Sales Taxes: 7.65
    # Total: 65.15
    it 'calculates total for input 2' do
      products = [
        Product.new( 'imported box of chocolates', true, 'food', 10.00 ),
        Product.new( 'imported bottle of perfume', true, 'other', 47.50 )
      ]
      cash_register = CashRegister.new(products)
      assert_equal 65.15, cash_register.total_with_tax
    end

    it 'calculates total sales tax for input 2' do
      products = [
        Product.new( 'imported box of chocolates', true, 'food', 10.00 ),
        Product.new( 'imported bottle of perfume', true, 'other', 47.50 )
      ]
      cash_register = CashRegister.new(products)
      assert_equal 7.65, cash_register.total_tax
    end
  end
end
