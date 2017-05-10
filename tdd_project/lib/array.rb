class Array

  def my_uniq
    result = []
    self.each do |element|
      result << element unless result.include?(element)
    end
    result
  end

  def two_sum
    result = []
    (0..self.length - 2).each do |idx1|
      (idx1 + 1..self.length - 1).each do |idx2|
        result << [idx1, idx2] if self[idx1] + self[idx2] == 0
      end
    end
    result
  end

  def my_transpose
    transposed = Array.new(self.length) {Array.new}
    self.each do |array|
      array.each_with_index do |el, idx|
        transposed[idx] << el
      end
    end
    transposed
  end

  def stock_picker
    best_pair = []
    max_diff = 0

    (0..self.length - 2).each do |buy_day_idx|
      (buy_day_idx + 1..self.length - 1).each do |sell_day_idx|
        if self[sell_day_idx] - self[buy_day_idx] > max_diff
          max_diff = self[sell_day_idx] - self[buy_day_idx]
          best_pair = [buy_day_idx, sell_day_idx]
        end
      end
    end

    return [] if max_diff == 0
    best_pair
  end

end

class TowersofHanoi
  attr_accessor :array

  def initialize
    @array = [[3,2,1], [], []]
  end

  def render
    "Tower 1: #{array[0]}\nTower 2: #{array[1]}\nTower 3: #{array[2]}"
  end

  def move(start, finish)
    disk = array[start].last

    if array[finish].empty? || array[finish].last > disk
      array[finish] << array[start].pop
    else
      raise "Invalid move"
    end
  end

  def won?
    array.first.empty? && (array[-1] == [3,2,1] || array[-2] == [3,2,1])
  end

  def play
    until won?
      render
      puts "Enter your move as: start, finish"
      result = gets.chomp.split(",").map(&:to_i)
      x, y = result
      move(x, y)
    end
  end



end
