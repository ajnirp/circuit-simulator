#(1<<n=$*[0].to_i).times{|i|s=i.to_s(2).rjust(n,'0').split('').map(&:to_i);n.times{|j|puts"signal(x#{j+1},#{s[j]})."}}

# run like this: ruby all-outputs.rb number-of-inputs final-output-terminal-number 2>/dev/null

n = ARGV[0].to_i
m = ARGV[1].to_i
swipl_call="swipl -s csi.pl -g \"signal(y#{m},X), write(X).\" -t halt. -q 2>/dev/null"
original = File.read('cs.pl')
(1 << n).times do |i|
  signal_values = i.to_s(2).rjust(n,'0').split('').map(&:to_i)
  signal_facts = "\n"
  n.times do |j|
    signal_facts << "signal(x#{j+1},#{signal_values[j]}).\n"
  end
  File.open('csi.pl','w') do |f|
    f.write(original)
    f.write(signal_facts)
  end
  signal_values.each { |val| print val, " " }
  print ": "
  value = `#{swipl_call}`
  puts value
end