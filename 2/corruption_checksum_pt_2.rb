# Get list of numbers
lines = File.read("input").split("\n")

nums = []
lines.map{ |n| nums << n.split("\t").map{|m| m.to_i}}

sum = 0

nums.each do |n|
  puts n.inspect
  n.combination(2).each do |p|
    if(p[0] % p[1] == 0)
      sum += p[0] / p[1]
      puts (p[0] / p[1])
    elsif(p[1] % p[0] == 0)
      sum += p[1] / p[0]
      puts (p[1] / p[0])
     end
  end
end

puts sum