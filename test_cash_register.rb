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

  it 'calculate total for single product' do

    products = [
      Product.new( 'book', false, 'book', 12.49 )
    ]
    cash_register = CashRegister.new(products)
    assert_equal cash_register.total, 12.49
  end

  it 'calculate total for multiple products' do
    products = [
      Product.new( 'book', false, 'book', 12.49 ),
      Product.new( 'music cd', false, 'other', 14.99 ),
      Product.new( 'chocolate bar', false, 'food', 0.85 )
    ]
    cash_register = CashRegister.new(products)
    assert_equal cash_register.total, 28.33
  end

  it 'calculate total for two the same products and one different' do
    products = [
      Product.new( 'book', false, 'book', 12.49 ),
      Product.new( 'book', false, 'book', 12.49 ),
      Product.new( 'music cd', false, 'other', 14.99 )
    ]
    cash_register = CashRegister.new(products)
    assert_equal cash_register.total, 39.97
  end


end
