require 'minitest/autorun'
require_relative 'cash_register'

describe CashRegister do
  it 'returns products' do
    cr = CashRegister.new(['book', 'music cd', 'chocolate bar'])
    result = cr.products
    assert_equal result, ['book', 'music cd', 'chocolate bar']
  end
end
