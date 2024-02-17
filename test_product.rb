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
end
