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
	
	# private

	def grow_unblocked_moves_in_dir(dx, dy)
		moves = []
		x, y = pos
		new_x = x + dx
		new_y = y + dy
		
		while true
			
			#BOOKMARK: CHECK LOGIC IF NEW POSITION DOES NOT GO OOB, OR COLLIDE WITH ENEMY/ALLY PIECE
			#check out OOB
			if !(0..7).include?(new_x) || !(0..7).include?(new_y)
				break
			end
			#now checking if collide with ally
			if @board[[new_x,new_y]].symbol == self.symbol
				break
			end
			#checking if collide wit enemy
			if !@board[[new_x,new_y]].is_a?(NullPiece)
				moves << [new_x, new_y]
				break	
			end
			moves << [new_x, new_y]
			new_x += dx
			new_y += dy

		end
		moves
	end

	HORIZONTAL_DIRS = [[0,-1],[0,1],[1,0],[-1,0]]
	DIAGONAL_DIRS = [[-1,-1],[-1,1],[1,-1],[1,1]]
end

class Rook < Piece
	include Slideable

	private
	def move_dirs
	end
end