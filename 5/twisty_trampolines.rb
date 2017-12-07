instructions = File.open("input").read.split("\n").map {|ph| ph.to_i}
ptr = 0
steps = 0
while(ptr >= 0 && ptr < instructions.length)
  last_ptr = ptr
  ptr += instructions[ptr]
  instructions[last_ptr] += 1
  steps += 1
end
puts steps
