require_relative "piece.rb"
require_relative "null_piece.rb"


class Board

	def initialize
		@board = Array.new(8) { Array.new(8) }
		populate_board
	end

    def populate_board
        [0,1,6,7].each do |row_idx|
            @board[row_idx].map! do |space|
                Piece.new(nil,nil,nil)
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

		#Move piece
		piece = self[start_pos]
		self[end_pos] = piece
		self[start_pos] = NullPiece.instance

	end

end