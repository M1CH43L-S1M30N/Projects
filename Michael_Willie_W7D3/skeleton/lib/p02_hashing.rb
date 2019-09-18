class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    # hash_str = ""
    # self.each_with_index do |ele, i| 
    # hash_str += ele + i 
    # hash_str.to_i
    #integer.hash 
    self.join.to_i.hash
  end
end

class String
  def hash
    count = []
    self.each_char do |char| 
      count << char.ord 
    end
    count.flatten.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    count = 0 
    self.each do |k, v| 
      count += (k.to_s.ord + v.to_s.ord)
    end
    count.hash 
  end
end
