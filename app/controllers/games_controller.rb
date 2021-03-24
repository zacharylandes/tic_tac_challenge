class GamesController < ApplicationController
  skip_before_action :verify_authenticity_token
  
	def index
		respond_to do |format|
				format.html { render :template  => 'games/index'}
				format.json { render json:  Game.all }
		end
	end
  
	def new 
		game = Game.create!(board: 	3.times.map{|f|3.times.map{|s|"*"}})
		respond_to do |format|
				format.html { render :template  => 'games/new'}
				format.json { render json:  game.id }
		end
	end
  
		def update
			game = Game.find(params[:id])
			puts "saldskd#{params[:format]}"
			game.update_board(params) if params[:format] == "json"
			respond_to do |format|
					format.html { render :template  => 'games/new'}
					format.json { render json:  game}
			end
		end

		def show 
			game = Game.find(params[:id])
			respond_to do |format|
					format.html { render :template  => 'games/show'}
					format.json { render json:  game }
			end
		end
  end