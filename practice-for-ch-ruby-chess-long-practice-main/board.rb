class Board

	def initialize
		@board = Array.new(8) { Array.new(8) }
		
	end
    
	def [](pos) #pos == [x, y]
		a, b = pos
		@board[a][b] # @board[x,y]
	end

	def []=(pos, val)
		a, b = pos
		@board[a][b] = val
	end

	def move_piece(start_pos, end_pos)
	end

end