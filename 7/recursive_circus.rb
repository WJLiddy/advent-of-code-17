lines = File.open("input").read.split("\n")
nodes = {}
# Get information of each node.
lines.each do |l|
  words = l.split(" ")
  node = {}
  node["name"] = words[0]
  node["weight"] = words[1].tr("()","").to_i
  if l.include? "->"
    node["children"] = words[3...words.length].map{|n| n.tr(",","")}
  end
  nodes[node["name"]] = node
end

# Now, we need to find the root. To do this, you have to find a node that has no parent.
nodes.keys.each do |n|
  puts n if not nodes.values.each.any?{|v| (v["children"] && v["children"].include?(n))}
end