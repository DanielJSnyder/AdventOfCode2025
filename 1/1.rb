#!/usr/bin/ruby

class Safe
	def initialize
		@place = 50
		@visits = 0
		@clickvisits = 0
	end

	def rotate(dir, amount) 
		if dir == 'L'
			while amount > @place do @place = @place + 100 end
			@place = @place - amount
		else 
			@place = @place + amount
			@place = @place % 100
		end
		if @place == 0
			@visits = @visits + 1
		end
		puts "#{dir}#{amount} = #{@place}, #{@visits}"
	end

	attr_reader :visits
end

safe = Safe.new
while line = gets do
	line = line.chomp
	safe.rotate(line[0], Integer(line[1..-1]))
end

puts safe.visits
	
