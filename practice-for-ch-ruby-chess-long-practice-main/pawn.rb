require_relative "piece.rb"

class Pawn < Piece

	def symbol
		:Pn
	end

	def moves
		forward_steps + side_attacks
	end

	private

	def at_start_row?
		return true if self.color == :White && self.pos.first == 6
		return true if self.color == :Black && self.pos.first == 1
		false
	end

	def forward_dir
		if self.color == :White
			return -1
		else
			return 1
		end
		# self.color == :White ? -1 : 1
		# condition ? #true_return : #false_return
	end

	def forward_steps
		moves = []
		new_x = self.pos.first + forward_dir
		moves << [new_x, self.pos.last]
		
		if at_start_row?
			new_x += forward_dir
			moves << [new_x,self.pos.last]
		end

		moves.select do |move|
			!self.board[move].is_a?(NullPiece) && !self.board[move].nil?
		end
	end

	def side_attacks
		# moves = [[forward_dir,-1],[forward_dir,1]]
		
		new_x = self.pos.first + forward_dir
		moves = [[new_x,self.pos.last - 1], [new_x,self.pos.last + 1]]
		moves.select do |move|
			self.board[move].color != self.color
		end
	end
end