require_relative "piece.rb"
require_relative "null_piece.rb"
require_relative "rook_bishop_queen.rb"
require_relative "knightking.rb"
require_relative "pawn.rb"


class Board

	def initialize
		@board = Array.new(8) { Array.new(8) }
		populate_board
	end

    def populate_board
		backrow = [Rook,Knight,Bishop,Queen,King,Bishop,Knight,Rook]
		[0].each do |row_idx|
            @board[row_idx].each_with_index do |space,col_idx|				
                self[[row_idx,col_idx]] = backrow[col_idx].new(:Black,self,[row_idx,col_idx])				
            end
        end
		[7].each do |row_idx|
            @board[row_idx].each_with_index do |space,col_idx|				
                self[[row_idx,col_idx]] = backrow.reverse[col_idx].new(:White,self,[row_idx,col_idx])				
            end
        end
        [1].each do |row_idx|
            @board[row_idx].each_with_index do |space, col_idx|
                self[[row_idx,col_idx]] = Pawn.new(:Black,self,[row_idx,col_idx])
            end
        end
		[6].each do |row_idx|
            @board[row_idx].each_with_index do |space, col_idx|
                self[[row_idx,col_idx]] = Pawn.new(:White,self,[row_idx,col_idx])
            end
        end
		[2,3,4,5].each do |row_idx|
			@board[row_idx].map! do |space|
				NullPiece.instance
			end
		end
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
		raise "no piece!" if self[start_pos].is_a?(NullPiece)

        raise "please move piece to new position" if start_pos == end_pos
		
		#check end_pos:
		end_pos.each do |ele|
			if ele < 0 || ele > 7
				raise "invalid end position"
			end
		end
		piece = self[start_pos]
		p piece.moves
		raise "invalid move!!!" if !piece.moves.include?(end_pos)

		#Move piece
		
		piece.pos = end_pos
		self[end_pos] = piece
		self[start_pos] = NullPiece.instance

	end

end