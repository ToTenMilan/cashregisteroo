require_relative 'cash_register'
require_relative 'product'
require_relative 'receipt'

cash_register = CashRegister.new([
  Product.new( 'book', false, 'book', 12.49 ),
  Product.new( 'book', false, 'book', 12.49 ),
  Product.new( 'music cd', false, 'other', 14.99 ),
  Product.new( 'chocolate bar', false, 'food', 0.85 )
])

receipt = Receipt.new(cash_register.result)
p receipt.print
