banks = File.open("input").read.split("\t").map{|s| s.to_i}

seen_before = Hash.new(0)
itrs = 0
count_itrs = false

while(true)
  # How many times have we seen this?
  seen_before[banks] += 1
  # Start counting if we have seen it once before.
  count_itrs = true if (seen_before[banks] == 2)
  break if (seen_before[banks] == 3)

  # Runs the algorithm of evening out a bank.
  max_val = banks.max
  max_idx = banks.index{|b| b == max_val}
  banks[max_idx] = 0
  max_val.times do |m|
    banks[(max_idx + m + 1) % (banks.length)] += 1
  end

  # Count only if we're looking for something seen before.
  itrs += 1 if count_itrs
end
puts itrs
