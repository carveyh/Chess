require_relative "piece.rb"
require "byebug"

module Stepable
	
	def king_dirs
		KING_DIRS
	end

	def knight_dirs
		KNIGHT_DIRS
	end

	def moves
		moves = []
		x, y = pos
		move_diffs.each do |diff|
			dx, dy = diff
			new_x = x + dx
			new_y = y + dy
			#check out OOB
			if !(0..7).include?(new_x) || !(0..7).include?(new_y)
				next
			end
			#now checking if collide with ally
			# debugger
			if @board[[new_x,new_y]].color == self.color
				next
			end
			moves << [new_x, new_y]
		end
		moves
	end

	private

	KING_DIRS = [[-1,-1],[-1,0],[-1,1],[0,-1],[0,1],[1,-1],[1,0],[1,1]].freeze
	KNIGHT_DIRS = [[-2,-1],[-1,-2],[-2,1],[-1,2],[1,-2],[2,-1],[1,2],[2,1]].freeze

	def move_diffs
		raise NotImplementedError
	end


end

class Knight < Piece

	include Stepable

	def symbol
		:Kn
	end

	protected
	def move_diffs
		knight_dirs
	end
end

class King < Piece
	include Stepable

	def symbol
		:King
	end

	protected
	def move_diffs
		king_dirs
	end
end