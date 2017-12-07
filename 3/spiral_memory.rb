input =  312051


def max_in_ring(ring_num)
  return (((2*ring_num) - 1)**2)
end
# Define ring to start with ring 1 = "1"
# ring 2 = "2 3 4 ... 9"

# The max number in each ring is ((2n - 1)^2)
# So, we need to solve for ((2n - 1)^2) > input.
# 2n - 1 > sqrt(input)
# n > (sqrt(input) + 1 / 2)

ring_num = ((Math.sqrt(input) + 1) / 2).ceil
max = max_in_ring(ring_num)
puts max
# thus we know the max number is in position (ring_num-1,ring_num-1)

# Now, we need to find the position. The dimensions of a ring are (2n - 1).
# Find what dimension we're in.
dim = (2*ring_num - 1)

loc = :null
# We can look up the side of the table using this algo:
if (input > max - dim)
  loc = :bottom
elsif (input > 1 +(max - 2*dim))
  loc = :left
elsif (input > 2 + (max - 3*dim))
  loc = :top
elsif (input > 3 + (max - 4*dim))
  loc = :right
end

puts loc
axis_delta = 0
# Finally, calculate the offset from the middle of whatever axis we're on.
case loc
  when :bottom
    axis_delta = (((max - ((2*ring_num) - 1)/2)) - input).abs
end

puts ring_num-1 + axis_delta


