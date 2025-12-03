
class IdRange
  def initialize(string_input)
	  splitup = string_input.split('-')
		@start = Integer(splitup[0])
		@end = Integer(splitup[1])
	end

	def isInvalidComplex(num)
		str_rep = num.to_s
		pattern = ""
	  str_rep.each_char do |c|
			pattern.concat(c)
			if pattern.size*2 > str_rep.size
				return false
			end
			if str_rep.gsub(pattern, "").empty?
				return true
			end
		end
	end

	def isInvalid(num)
	  str_rep = num.to_s
		first_half = str_rep.slice(0, str_rep.size/2)
		return first_half.concat(first_half) == str_rep
	end

	def invalidSum
		invalids = []
		(@start..@end).each {|n| invalids.push(n) if isInvalid(n)}
		return invalids.sum
	end
end

	
input=gets

sum = 0
input.split(',').each {|s| 
	invalid_s = IdRange.new(s).invalidSum
	sum += invalid_s
	}
puts sum

