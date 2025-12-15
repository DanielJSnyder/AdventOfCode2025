
class FreshRange
	def initialize(line)
		split_line = line.split('-')
		@min_val = Integer(split_line[0])
		@max_val = Integer(split_line[1])
	end

	def inRange?(num)
	  num <= @max_val && num >= @min_val
	end

end
class RangeTable
	def initialize
		@ranges = []
	end

	def addRange(line)
		@ranges.push(FreshRange.new(line))
	end

	def isFresh?(num)
		@ranges.any?{ |r| r.inRange?(num)}
	end
end

range_table = RangeTable.new()
while input = gets do
	input.chomp!
	break if input.empty?
	range_table.addRange(input)
end

# Read the ingredients, check for freshness
num_fresh = 0
while input = gets do
	input.chomp!
	num_fresh += 1 if range_table.isFresh?(Integer(input))
end
puts num_fresh
