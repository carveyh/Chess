require_relative "piece.rb"

module Slideable

	def horizontal_dirs
		HORIZONTAL_DIRS
	end

	def diagonal_dirs
		DIAGONAL_DIRS
	end

	def moves
		move = []
		move_dirs.each do |dir|
			dx, dy = dir
			move += grow_unblocked_moves_in_dir(dx, dy)
		end
		move
	end
	
	private

	HORIZONTAL_DIRS = [[0,-1],[0,1],[1,0],[-1,0]].freeze
	DIAGONAL_DIRS = [[-1,-1],[-1,1],[1,-1],[1,1]].freeze

	def move_dirs
		raise NotImplementedError
	end

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
			if @board[[new_x,new_y]].color == self.color
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
end

class Rook < Piece
	include Slideable

	def symbol
		:Rk
	end

	private
	def move_dirs
		horizontal_dirs 
	end
end

class Bishop < Piece
	include Slideable

	def symbol
		:Bp
	end

	private
	def move_dirs
		diagonal_dirs 
	end
end

class Queen < Piece
	include Slideable

	def symbol
		:Qu
	end

	private
	def move_dirs
		diagonal_dirs + horizontal_dirs
	end
end