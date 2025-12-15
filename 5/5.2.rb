
class FreshRange
	attr_reader :min_val
	attr_reader :max_val

	def initialize(line)
		split_line = line.split('-')
		@min_val = Integer(split_line[0])
		@max_val = Integer(split_line[1])
	end

	def inRange?(num)
	  num <= @max_val && num >= @min_val
	end

	def overlaps?(other)
		self.inRange?(other.min_val) or self.inRange?(other.max_val) or other.inRange?(@min_val) or other.inRange?(@max_val)
	end

	def combine!(other)
		@min_val = [other.min_val, min_val].min
		@max_val = [other.max_val, max_val].max
		self
	end
	
	def num_fresh
		@max_val-@min_val + 1
	end

	def to_s
		"[#{@min_val}-#{@max_val}]"
	end

end
class RangeTable
	def initialize
		@ranges = []
	end

	def addRange(line)
		new_range = FreshRange.new(line)
		@ranges.each {|r|
			new_range.combine!(r) if r.overlaps?(new_range)
		}

		@ranges.delete_if { |r| r.overlaps?(new_range) }
		@ranges.push(new_range)
	end

	def isFresh?(num)
		@ranges.any?{ |r| r.inRange?(num)}
	end

	def num_fresh
		@ranges.sum{|r| r.num_fresh}
	end

	def printRanges
		@ranges.each { |r| puts r}
	end
end

range_table = RangeTable.new()
while input = gets do
	input.chomp!
	break if input.empty?
	range_table.addRange(input)
end
puts range_table.num_fresh
