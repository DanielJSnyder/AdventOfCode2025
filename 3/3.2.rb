def getMaxChar(s)
	return s.chars.max
end

def getJoltageRecursive(battery_str, num_elements)
	max_joltage = 0
	if num_elements == 1
		return getMaxIntChar(battery_str)
	end
	battery_str.each_char.with_index  do 
		|c, i|
			if i+num_elements-1 < battery_str.size
				max_joltage = [max_joltage, Integer(c) * 10 ** (num_elements-1) + getJoltageRecursive(battery_str[i+1..-1], num_elements-1)].max
			end
	end
	return max_joltage
end

def getGreedyJoltage(battery_str, num_elements)
	#puts "GJ: bs=#{battery_str}, ne=#{num_elements}"
	if num_elements == 1
		return getMaxChar(battery_str)
		end
	if battery_str.size == num_elements
		return battery_str
	end

	greedy_joltage =	'0'*num_elements

	max_char = '0'
	max_index = 0
	battery_str.each_char.with_index do |c, i| 
		if ((battery_str.size - i+1) > num_elements) and (c > max_char)
			max_char = c
			max_index = i
		end
	end
	greedy_joltage[0] = max_char
	greedy_joltage[1..-1] = getGreedyJoltage(battery_str[max_index+1..-1], num_elements-1)
	return greedy_joltage
end

sum_joltage = 0
n = 0
while input = gets do
	input.chomp!
	n+=1
	joltage = Integer(getGreedyJoltage(input, 12))
	puts "For line #{n}: #{input} joltage is: #{joltage}"
	sum_joltage += joltage
end
puts sum_joltage
