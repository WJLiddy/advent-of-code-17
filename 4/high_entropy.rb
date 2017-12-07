phrases = File.open("input").read.split("\n").map {|ph| ph.split}
# Now we have each phrase it it's own list
# Reject any passphrase where two words are the same.
puts phrases.reject{|p| p.combination(2).any?{|a,b| a == b}}.length
