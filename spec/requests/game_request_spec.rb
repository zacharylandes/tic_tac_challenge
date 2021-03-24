require 'rails_helper'
RSpec.describe "Game API" do 
  
	context "HTTP" do 
		it "returns all games" do
			create_list(:game, 5)
			get '/games.json'
	
			expect(response).to be_successful
			games = JSON.parse(response.body)
			expect(Game.count).to eq(5)
			expect(Game.find(games.first["id"])).to be_instance_of(Game)
		end

		it "returns one game" do
			create_list(:game, 1)
			get "/games/#{Game.first.id}.json"
	
			expect(response).to be_successful
			game = JSON.parse(response.body)
			expect(Game.find(game["id"])).to be_instance_of(Game)
		end

		it 'creates a new game' do 
			create_list(:game, 1)

			 data = {
				"outerIndex": 0,
				"innerIndex": 1,
				"firstPlayer": true,
			}
			put "/games/#{Game.first.id}.json",params: data
			expect(response).to be_successful
			game = JSON.parse(response.body)

		end

	end
end