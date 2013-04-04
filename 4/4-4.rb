100.upto(999).flat_map{ |i| i.upto(999).map {|j| i * j}}.max_by{|p| p.to_s == p.to_s.reverse ? p : -1 }
