require_relative 'spec_helper'
require_relative '../models/grid'

RSpec.describe 'grid' do
  describe 'grid behaves as tic tac toe grid' do
    let (:grid){ Grid.new(3, 3) }

    it 'should build grid on initialize' do

      comparison_grid = [
        [nil, nil, nil],
        [nil, nil, nil],
        [nil, nil, nil],
      ]

      expect(grid.grid).to eq(comparison_grid)
    end

    it 'should evaluate winning rows' do
      grid.occupy(0, 0, :x)
      grid.occupy(1, 0, :x)
      grid.occupy(2, 0, :x)

      expect(grid.evaluate_row_for_win).to be_truthy
    end

    it 'should evaluate false if row is occupied by two different characters' do
      grid.occupy(0, 1, :x)
      grid.occupy(1, 1,:o)
      grid.occupy(2, 1, :x)

      expect(grid.evaluate_column_for_win).to be_falsey
    end
  end

end