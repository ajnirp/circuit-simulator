32.times do |n|
  row = n.to_s(2).rjust(5,'0').split('').map(&:to_i)
  row.each { |x| print x, " "}
  puts row.count(1) > row.count(0) ? 1 : 0
end