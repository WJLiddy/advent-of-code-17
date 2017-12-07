# Get list of numbers
# (Chomp is for removing newline at end of file).
numbers = File.read("input").chomp.split("").map{|n| n.to_i}

sum = 0

# If a number in the list matches the next one, 
# add it to the sum.
# Handles the "wrap" case by checking length.
numbers.each_with_index do |n,i|
  next_num_idx = (i + (0.5*numbers.length).to_i) % numbers.length
  sum += n if n == numbers[next_num_idx]
end

puts sum