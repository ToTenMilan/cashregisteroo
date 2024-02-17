require 'minitest/autorun'
require_relative 'cash_register'

describe CashRegister do
  it 'returns products with amounts and all the data' do
    products = [
      { name: 'book', imported: false, category: 'book', price: 12.49, amount: 2 },
      { name: 'music cd', imported: false, category: 'other', price: 14.99, amount: 1 },
      { name: 'chocolate bar', imported: false, category: 'food', price: 0.85, amount: 1 }
    ]
    cash_register = CashRegister.new(products)
    assert_equal cash_register.products, products
  end

  it 'calculate total for single product' do
    products = [
      { name: 'book', imported: false, category: 'book', price: 12.49, amount: 2 }
    ]
    cash_register = CashRegister.new(products)
    assert_equal cash_register.total, 24.98
  end

  it 'calculate total for two products' do
    products = [
      { name: 'book', imported: false, category: 'book', price: 12.49, amount: 2 },
      { name: 'music cd', imported: false, category: 'other', price: 14.99, amount: 1 }
    ]
    cash_register = CashRegister.new(products)
    assert_equal cash_register.total, 39.97
  end
end
