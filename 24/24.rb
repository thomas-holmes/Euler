# Somewhat brute force but it works
digits = ('0'..'9')

def permute(num, candidates)
  if candidates.empty?
    return num
  end

  return candidates.flat_map { |i| permute(num + i, candidates - [i]) }
end


puts result = digits.flat_map{ |i| permute(i, digits.to_a - [i]) }.sort[999999]
