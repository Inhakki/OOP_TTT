require_relative '../models/grid'

RSpec.describe 'grid' do

  describe 'grid behaves as tic tac toe grid' do
    before(:each) do
      grid = Grid.new(3, 3)
    end

    it 'should build grid on initialize' do
      grid
      debugger
    end

  end
end