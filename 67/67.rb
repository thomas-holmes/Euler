f = open("67.txt")

tri = f.map{ |l| l.split.map { |i| i.to_i } }

tri_r = tri.reverse

# Not very ruby-like. Need to come up with a better way to do this

i = 0
tri_r.each do |r|
  ni = 0
  r.each do |n|
    if i == 0
      break
    end

    res1 = r[ni] + tri_r[i-1][ni] 
    res2 = r[ni] + tri_r[i-1][ni+1]
    r[ni] = [res1, res2].max

    ni = ni + 1
  end
  i = i + 1
end

puts tri_r.last
