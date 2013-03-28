puts (100..999).flat_map { |i| (i..999).map { |j| i * j }}.select { |i| i.to_s == i.to_s.reverse }.max
