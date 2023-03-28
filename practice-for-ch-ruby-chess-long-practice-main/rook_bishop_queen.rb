require_relative "piece.rb"

module Slideable
	
	def horizontal_dirs
		HORIZONTAL_DIRS
	end

	def diagonal_dirs
		DIAGONAL_DIRS
	end

	def moves(start_pos)
		move = []
		horizontal_dirs.each do |step|
			origin = start_pos
			x, y = origin
			step_x, step_y = step
			new_x = x + step_x
			new_y = y + step_y
			until new_x < 0 || new_x > 7 || new_y < 0 || new_y > 7
				move << [new_x, new_y]
				new_x += step_x
				new_y += step_y
			end
		end
		move
	end
	
	private
	HORIZONTAL_DIRS = [[0,-1],[0,1],[1,0],[-1,0]]
	DIAGONAL_DIRS = [[-1,-1],[-1,1],[1,-1],[1,1]]
end

class Rook < Piece

	private
	def move_dirs
	end
end