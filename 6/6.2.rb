def getNumberForColumn(lines, col) 
	return nil if col >= lines[0].size
	number = ''
	lines.each { |line| number += line[col] }
	if number.strip.empty? then
		return nil
	end
	number.strip.to_i
end

total_input = []
operators = []
while input=gets do
	if input.include? '*' then
		operators = input.chomp.split(' ')
	else
		total_input.append(input.chomp)
	end
end

col_counter = 0
overall_sum = 0
operators.each {
	|operator|
	column_numbers = [getNumberForColumn(total_input, col_counter)]
	col_counter +=1
	while (number = getNumberForColumn(total_input, col_counter) )!= nil do
		col_counter +=1
		column_numbers.append(number)
	end
	col_counter +=1 # Skip over the space column since the increment is in the loop body
	case operator
	when '*'
		prod = 1
		column_numbers.each { |n| prod = prod * n }
		overall_sum += prod
	when '+'
		overall_sum +=column_numbers.sum
	end
}

puts overall_sum

