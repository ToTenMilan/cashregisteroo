require 'minitest/autorun'
require_relative 'cash_register'

describe CashRegister do
  it 'returns products and all the data' do
    products = [
      { name: 'book', imported: false, category: 'book', price: 12.49 },
      { name: 'book', imported: false, category: 'book', price: 12.49 },
      { name: 'music cd', imported: false, category: 'other', price: 14.99 },
      { name: 'chocolate bar', imported: false, category: 'food', price: 0.85 }
    ]
    cash_register = CashRegister.new(products)
    assert_equal cash_register.products, products
  end

  it 'calculate total for single product with sales tax' do
    skip

    products = [
      { name: 'book', imported: false, category: 'book', price: 12.49 }
    ]
    cash_register = CashRegister.new(products)
    assert_equal cash_register.total, 13.12 # 12.49 + 0.63
  end


end
