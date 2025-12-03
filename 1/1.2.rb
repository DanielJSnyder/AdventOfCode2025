#!/usr/bin/ruby

class Safe
	def initialize
		@place = 50
		@visits = 0
	end

	def rotate(dir, amount) 
		while amount != 0 do 
			if dir == 'L'
				@place = @place - 1
			else 
				@place = @place + 1
			end
			amount = amount - 1
			case @place
				when -1 then @place = 99
				when 100  then @place = 0
			end
			if @place == 0
				@visits = @visits + 1
			end
		end
	end

	attr_reader :visits
end

safe = Safe.new
while line = gets do
	line = line.chomp
	safe.rotate(line[0], Integer(line[1..-1]))
end

puts safe.visits
