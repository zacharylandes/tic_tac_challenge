class Game  < ApplicationRecord

	def update_board(params)
		x_or_o = params[:firstPlayer] ? "X" : "0"
		board[params[:outerIndex].to_i][params[:innerIndex].to_i] = x_or_o
		self.update!(board: board)
		if game_over?(board,params[:firstPlayer])
			winner = x_or_o
			self.update(winner: winner)
		end
	end

	def check_board(board,x_or_o)
		if board[0][0] == x_or_o && board[1][1] == x_or_o && board[2][2] == x_or_o
			true
		elsif board.select{|row| row == [x_or_o, x_or_o, x_or_o]}.present?
			true
		elsif board[0][0] == x_or_o && board[1][0] == x_or_o && board[2][0] == x_or_o
			true
		elsif board[0][1] == x_or_o && board[1][1] == x_or_o && board[2][1] == x_or_o
			true
		else
			false
		end
	end

	def game_over?(board,first_player)
		x_or_o = first_player ? "X" : "0"
		standard= check_board(board,x_or_o) 
		reversed = check_board(board.map{|row|row.reverse},x_or_o) 
		true.in?([standard,reversed])
	end

	def new_board
		3.times.map{|f|3.times.map{|s|"*"}}
	end
end
