class Grid
	def initialize
		@grid = ""
		@grid_width=0
		@grid_length=0
	end

	def addGridLine(line)
		if @grid.empty?
			@grid_width = line.size
		end
		@grid += line
		@grid_length += 1
	end

	def calculateGettableRolls()
		gettable_rolls = 0
		loop do
			old_rolls_gotten = gettable_rolls
			tracking_grid = [0]*@grid.size
			@grid.each_char.with_index {|c,i|
				if c == '@'
					surroundingIdxsFor(i).each { |idx| 
						tracking_grid[idx] += 1
					}
				end	
			}

			keep_going = false
			tracking_grid.each_index { |i|
				if @grid[i] == '@' && tracking_grid[i] < 4
					@grid[i] = '.'
					gettable_rolls +=1 
					keep_going = true
				end
			}
			
			break if not keep_going
		end

		return gettable_rolls
	end

	def surroundingIdxsFor(idx)
		l,w = idx.divmod(@grid_width)
		coord_arr = [[w-1,l-1], [w,l-1], [w+1,l-1],
					  [w-1,l], [w+1,l],
						[w-1,l+1], [w,l+1], [w+1,l+1]].select { |coords|
						coords[0]>=0 && coords[0] <@grid_width &&
						coords[1]>=0 && coords[1] <@grid_length}

		filtered_array = coord_arr.map{ |coords| idxFor(coords[0], coords[1])}
		#puts "for idx: #{idx} on #{@grid_width} x #{@grid_length} got [#{w},#{l}] coord_s of: #{coord_arr} => #{filtered_array}"
		return filtered_array
	end


	def idxFor(w,l)
		l*@grid_width+w
	end


end

grid = Grid.new

while input =gets do
	input.chomp!
	grid.addGridLine(input)
end

puts grid.calculateGettableRolls()
