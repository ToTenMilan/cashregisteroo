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
    assert_equal 1.499, product.sales_tax
  end


  it 'returns 0 tax for exempt product' do
    product = Product.new('book', false, 'book', 12.49)
    assert_equal 0, product.sales_tax
  end

  it 'returns import tax for imported product' do
    product = Product.new('imported box of chocolates', true, 'food', 10.00)
    assert_equal 0.5, product.import_tax
  end

  it 'returns 0 import tax for non-imported product' do
    product = Product.new('book', false, 'book', 12.49)
    assert_equal 0, product.import_tax
  end
end
