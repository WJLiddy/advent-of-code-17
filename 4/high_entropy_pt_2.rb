phrases = File.open("input").read.split("\n").map {|ph| ph.split}
# Now we have each phrase it it's own list
# Reject any passphrase where two words are anagrams
# Fun fact - you can use "&" to and an array. Ended up not using it but neat.

puts phrases.reject{|p| p.combination(2).any?{|a,b| a.chars.sort.to_a == b.chars.sort.to_a}}.length
