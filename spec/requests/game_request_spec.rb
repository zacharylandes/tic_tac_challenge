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
	end
end