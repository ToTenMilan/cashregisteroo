require 'minitest/autorun'
require_relative 'product'

describe Product do
  it 'returns product data' do
    product = Product.new('book', false, 'book', 12.49)
    assert_equal product.name, 'book'
    assert_equal product.imported, false
    assert_equal product.category, 'book'
    assert_equal product.price, 12.49
  end

  it 'returns sales tax for non-exempt product' do
    product = Product.new('music cd', false, 'other', 14.99)
    assert_equal product.sales_tax, 1.5
  end


  it 'returns 0 tax for exempt product' do
    product = Product.new('book', false, 'book', 12.49)
    assert_equal product.sales_tax, 0
  end
end
