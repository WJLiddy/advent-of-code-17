# Get list of numbers
lines = File.read("input").split("\n")

nums = []
lines.map{ |n| nums << n.split("\t").map{|m| m.to_i}}

sum = 0

nums.each do |n|
  sum += (n.max - n.min)
end

puts sum