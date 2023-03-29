class Piece

	attr_reader :pos, :color, :board
	
	def initialize(color, board, pos)
		@color = color
		@board = board
		@pos = pos
	end

	def pos=(new_pos)
		@pos = new_pos
	end

	def symbol
		@color
	end

	def move_into_check?(end_pos)
		#check valid moves if king piece is
	end
end