puts (1...1000000000000)
  .select{|i| i.to_s == i.to_s.reverse}
  .select{|i| i.to_s(2) == i.to_s(2).reverse}
  .reduce(:+)
