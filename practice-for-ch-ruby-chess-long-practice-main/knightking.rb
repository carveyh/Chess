require_relative "piece.rb"

module Stepable
	
	KING_DIRS = [[-1,-1],[-1,0],[-1,1],[0,-1],[0,1],[1,-1],[1,0],[1,1]]
	KNIGHT_DIRS = [[]]

	def king_dirs
		KING_DIRS
	end

	def knight_dirs
		KNIGHT_DIRS
	end
	
	def move_diffs
		raise NotImplementedError
	end

	def moves
		
	end
end

class Knight

	def symbol
		:Kn
	end

	protected
	def move_diffs

	end
end