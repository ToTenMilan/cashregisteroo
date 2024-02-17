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

  it 'calculate total for single product' do
    products = [
      { name: 'book', imported: false, category: 'book', price: 12.49 }
    ]
    cash_register = CashRegister.new(products)
    assert_equal cash_register.total, 12.49
  end

  it 'calculate total for two products' do
    products = [
      { name: 'book', imported: false, category: 'book', price: 12.49 },
      { name: 'music cd', imported: false, category: 'other', price: 14.99 }
    ]
    cash_register = CashRegister.new(products)
    assert_equal cash_register.total, 27.48
  end

  it 'calculates tax for two the same products and one different' do
    products = [
      { name: 'book', imported: false, category: 'book', price: 12.49 },
      { name: 'book', imported: false, category: 'book', price: 12.49 },
      { name: 'music cd', imported: false, category: 'other', price: 14.99 }
    ]
    cash_register = CashRegister.new(products)
    assert_equal cash_register.total, 39.97
  end
end
