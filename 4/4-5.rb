puts 100.upto(999).
  flat_map { |i| i.upto(999).map { |j| i * j } }.
  select   { |p| p.to_s == p.to_s.reverse }.
  max
