def my_uniq(array)
  els = Hash.new(0)
  array.each do |el|
    els[el] += 1
  end
  els.keys
end

class Array
  def two_sum
    pairs = []
    (0...self.length).each do |idx|
      (idx + 1...self.length).each do |i|
        pairs << [idx, i] if self[idx] + self[i] == 0
      end
    end
    pairs
  end
end

def my_transpose(array)
  return [[]] if array == [[]]
  transposed = []
  i = 0
  while i < array.length
    cols = []
    (0...array.length).each do |idx|
      cols << array[idx][i]
    end
    transposed << cols
    i += 1
  end
  transposed
end

def stock_picker(array)
  profit = 0
  pair = []
  (0...array.length).each do |idx|
    (idx + 1...array.length).each do |i|
      if array[i] - array[idx] > profit
        pair = [idx, i]
        profit = array[i] - array[idx]
      end
    end
  end
  pair
end