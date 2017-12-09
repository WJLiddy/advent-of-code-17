instr = File.open("input").read.split("\n").map{|s| s.split(" ")}
puts instr.inspect
reg = Hash.new(0)

instr.each do |i|
  puts i.inspect
  puts "#{reg[i[4]]} #{i[5]} #{reg[i[6]]}"
  reg[i[0]] += (i[1] == "inc" ? i[2].to_i : -(i[2].to_i)) if eval("#{reg[i[4]]} #{i[5]} #{i[6]}")
end

puts reg.values.max