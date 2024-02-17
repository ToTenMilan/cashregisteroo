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
    assert_equal cash_register.sales_tax, 1.5
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
    assert_equal cash_register.sales_tax, 0.5
  end


end
