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

    context "evaluates rows correctly for winners" do
      it 'should evaluate winning rows' do
        grid.occupy(0, 0, :x)
        grid.occupy(1, 0, :x)
        grid.occupy(2, 0, :x)

        expect(grid.winner?).to be_truthy
      end

      it 'should evaluate false if row is occupied by two different characters' do
        grid.occupy(0, 1, :x)
        grid.occupy(1, 1,:o)
        grid.occupy(2, 1, :x)

        expect(grid.winner?).to be_falsey
      end
    end

    context "evalutes columns correctly for winners" do
      it "should evaluate winning columns" do
        grid.occupy(2, 0, :o)
        grid.occupy(2, 1, :o)
        grid.occupy(2, 2, :o)

        expect(grid.winner?).to be_truthy
      end

      it "should evaluate false if column is occupied by two different characters" do
        grid.occupy(0, 0, :o)
        grid.occupy(0, 1, :x)
        grid.occupy(0, 2, :o)

        expect(grid.winner?).to be_falsey
      end
    end

    context "evaluates diagonal wins correctly" do
      it "should evaluate top left to bottom right" do
        grid.occupy(0, 0, :o)
        grid.occupy(1, 1, :o)
        grid.occupy( 2, 2, :o)

        expect(grid.winner?).to be_truthy
      end

      it "should evaluate a win from bottom left to top right" do
        grid.occupy(0, 2, :x)
        grid.occupy( 1, 1, :x)
        grid.occupy(2, 0, :x)

        expect(grid.winner?).to be_truthy
      end

      it "should evaluate as false if diagonal in mixed characters" do
        grid.occupy(0, 0, :o)
        grid.occupy(1, 1, :o)
        grid.occupy( 2, 2, :x)

        expect(grid.winner?).to be_falsey
      end

    end

    context "evaluates draw games in a dumb way" do
      it "should return true for cats game if all spaces are occupied" do
        grid.occupy(0, 0, :o)
        grid.occupy(0, 1, :o)
        grid.occupy(0,2, :x)
        grid.occupy(1, 0, :x)
        grid.occupy(1, 1, :x)
        grid.occupy(1, 2, :o)
        grid.occupy( 2, 0, :o)
        grid.occupy(2, 1, :o)
        grid.occupy(2, 2, :x)

        expect(grid.winner?).to be_falsey
        expect(grid.cats_game?).to be_truthy
      end
    end

  end

end