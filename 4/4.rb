maxProduct = 0
(100..999).each do |i|
  (100..999).each do |j|
    product = i * j
    if product > maxProduct && (product.to_s == product.to_s.reverse)
      maxProduct = product
    end
  end
end
puts(maxProduct)
