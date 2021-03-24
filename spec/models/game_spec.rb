require 'rails_helper'

describe Game, type: :model do
  describe 'relationships' do 

    let(:game) {Game.create}
    let(:board) {Game.create(board)}
    it 'is valid' do 

     expect(game).to be_valid

    end


  end
end