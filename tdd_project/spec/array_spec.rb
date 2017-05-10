require 'rspec'
require 'array'

describe Array do
  let(:array) { [1,1,2,2,3,4] }
  let(:array_sum) { [-1, 0, 2, -2, 1] }
  # let(:empty_array) { [] }

  describe "#my_uniq" do
    it "It gets rid of duplicates" do
      expect(array.my_uniq).to eq([1,2,3,4])
    end
  end

  describe "#two_sum" do
    it "Returns an array" do
      result = array_sum.two_sum
      expect(result).to be_an_instance_of(Array)
    end

    it "Returns an empty array when array is empty" do
      expect([].two_sum).to eq([])
    end

    it "Return smaller index before larger index" do
      array = [-1, 1, 3, 4, -3]
      result = array.two_sum
      boolean_result = result.all? do |pair|
        pair[0] < pair[1]
      end

      expect(boolean_result).to be true
    end

    it "Returns the indices that add to zero" do
      expect(array_sum.two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe "#my_transpose" do
    let(:initial_array) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }

    it "Initial array is a square matrix" do
      boolean_res = initial_array.all? {|el| el.length == initial_array.length }
      expect(boolean_res).to be true
    end

    it "Result array's length is same as initial array's" do
      new_array = initial_array.my_transpose
      expect(initial_array.length).to eq(new_array.length)
    end

    it "Transposes the initial array" do
      result = [[0, 3, 6], [1, 4, 7], [2, 5, 8]]
      expect(initial_array.my_transpose).to eq(result)
    end

  end

  describe "#stock_picker" do
    let(:stocks) { [2, 4, 1, 8, 9] }
    let(:stocks_same) { [2, 2, 2] }

    it "Returns empty if price is the same" do
      if stocks_same.count(stocks_same.first) == stocks_same.length
        expect(stocks_same.stock_picker).to eq([])
      end
    end

    it "Always returns two days" do
      pair = stocks.stock_picker
      boolean = stocks.count(stocks.first) == stocks.length
      if boolean == false
        expect(pair.length).to eq(2)
      end
    end


    it "Sells at higher price" do
      x, y = stocks.stock_picker
      expect(stocks[x]).to be <= stocks[y]
    end
  end
end

describe TowersofHanoi do

  subject(:hanoi) {TowersofHanoi.new}

  it "Initializes the three towers correctly" do
    expect(hanoi.array).to eq([[3,2,1], [], []])
  end

  describe "#render" do
    it "Displays the towers in their initial state" do
      expect(hanoi.render).to eq("Tower 1: [3, 2, 1]\nTower 2: []\nTower 3: []")

    end
  end

  describe "#move" do
    it "It can move to an empty tower" do
      hanoi.move(0,2)
      expect(hanoi.array).to eq([[3,2], [], [1]])
    end

    it "It can move to a greater disk" do
      hanoi.array = [[1], [], [3,2]]
      hanoi.move(0,2)
      expect(hanoi.array).to eq([[], [], [3,2,1]])
    end

    it "Raises error if move is invalid" do
      hanoi.array = [[1], [2], [3]]
      expect { hanoi.move(1,0) }.to raise_error("Invalid move")
    end
  end

  describe "#won?" do
    it "Returns true if tower has reassembled" do
      hanoi.array = [[], [], [3,2,1]]
      # result = hanoi.array.include?([3,2,1]) && hanoi.array.first.empty?
        #esult = hanoi.won?
      expect(hanoi.won?).to eq(true)
    end

    it "Returns false if tower has not been reassembled" do
      hanoi.array = [[], [1], [3,2]]
      # result = hanoi.array.include?([3,2,1]) && hanoi.array.first.empty?
        #esult = hanoi.won?
      expect(hanoi.won?).to eq(false)
    end
  end



end
