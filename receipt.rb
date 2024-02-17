class Receipt
  def initialize(result)
    @result = result
  end

  def print
    products = @result[:products].map do |product|
      "#{product[:amount]} #{product[:name]}: %.2f" % product[:price]
    end.join("\n")

    "#{products}\nSales Taxes: #{@result[:sales_taxes]}\nTotal: #{@result[:total]}"
  end
end
