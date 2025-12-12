def getMaxIntChar(s)
	return Integer(s.chars.max)
end

def getJoltage(battery_str)
	max_joltage = 0
	battery_str.each_char.with_index  do 
		|c, i|
			if i+1 < battery_str.size
				max_joltage = [max_joltage, Integer(c) * 10 + getMaxIntChar(battery_str[i+1..-1])].max
			end
	end
	return max_joltage
end

sum_joltage = 0
while input = gets do
	input.each_line(chomp: true) {|s| sum_joltage += getJoltage(s)}
end
puts sum_joltage
