banks = File.open("input").read.split("\t").map{|s| s.to_i}
seen_before = {}
itrs = 0
while(!seen_before[banks])
  seen_before[banks] = true
  max_val = banks.max
  max_idx = banks.index{|b| b == max_val}
  banks[max_idx] = 0
  max_val.times do |m|
    banks[(max_idx + m + 1) % (banks.length)] += 1
  end
  itrs += 1
end
puts itrs
