require 'minitest/autorun'
require_relative 'receipt'

describe Receipt do
  it 'prints blank receipt' do
    cash_register_result = {
      products: [
        { name: 'imported bottle of perfume', price: 32.19, amount: 1 },
        { name: 'bottle of perfume', price: 20.89, amount: 1 },
        { name: 'packet of headache pills', price: 9.75, amount: 1 },
        { name: 'imported box of chocolates', price: 35.40, amount: 3 }
      ],
      sales_taxes: 7.75,
      total: 98.23
    }
    receipt = Receipt.new(cash_register_result)
    assert_equal "1 imported bottle of perfume: 32.19\n1 bottle of perfume: 20.89\n1 packet of headache pills: 9.75\n3 imported box of chocolates: 35.40\nSales Taxes: 7.75\nTotal: 98.23", receipt.print
  end
end
