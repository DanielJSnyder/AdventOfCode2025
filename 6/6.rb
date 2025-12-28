
columns = []
input = ""
begin 
	input = gets.chomp
	columns = input.split(' ').map { |i| [Integer(i)] }
	while input = gets do
		input.chomp!
		input.split(' ').each.with_index { |s, i| columns[i].append(Integer(s)) }
	end

rescue
end

operators = input.split(' ')

overall_sum = 0
operators.each_index {
	|idx|
		case operators[idx]
		when '*'
				prod = 1
				columns[idx].each{ |n| prod = prod * n }
				overall_sum += prod
		when '+'
				overall_sum += columns[idx].sum
		end
}

puts overall_sum

