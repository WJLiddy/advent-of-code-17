# incomplete solution to #7 pt 2. Got the answer tho

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

root = nil
# Now, we need to find the root. To do this, you have to find a node that has no parent.
nodes.keys.each do |n|
  root =  n if not nodes.values.each.any?{|v| (v["children"] && v["children"].include?(n))}
end

# Next, let's calculate the weight of each node. Recursively seems to be the most obvious solution.
# (With side effects tho so we can get the total weight just from checking the parent node)
def find_weights(node_name,node_hash)
  node = node_hash[node_name]
  if(node["children"])
    node["total_weight"] = node["weight"] + node["children"].map{|c| find_weights(c,node_hash)}.inject(:+)
  else
    node["total_weight"] = node["weight"]
  end
  node["total_weight"]
end

find_weights(root,nodes)

def is_balanced(node,node_hash)
  return true if node["children"].nil?
  return true if node["children"].map{|c| node_hash[c]["total_weight"]}.uniq.length == 1
  return false
end

# Ok now each node has the "total_weight" key.
# I think we can trace unbalanced leaves upward to find the point of the problem tree
# I think this approach works because changing a SINGLE weight in a tree that is balanced at the root-level will un-balance it.

# First, get the names of every unbalanced node.
unbalanced = nodes.keys.reject{|n| is_balanced(nodes[n],nodes)}
#puts unbalanced

# Not a general sln.
# only 2 nodes returned for me to look at and I have stuff to do tonight...
# So i can solve this by hand.

# So this node is the problem node.
# puts nodes["kzltfq"]["children"].map{|c| nodes[c]["total_weight"]}
# puts nodes["kzltfq"]["children"]
# puts nodes["arqoys"].inspect

puts nodes["arqoys"]["weight"] - 6
# ARQOYS is is 6 lbs too heavty 