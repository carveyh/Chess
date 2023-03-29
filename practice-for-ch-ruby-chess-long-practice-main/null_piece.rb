require_relative "piece.rb"
require "singleton"

class NullPiece < Piece
	include Singleton

	def initialize
		@color = :Null
	end

	def moves
		[]
	end

	def symbol
		"_"
	end

	attr_reader :color
	
end