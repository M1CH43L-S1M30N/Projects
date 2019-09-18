class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @count == num_buckets 
    if !self.include?(key)
      @store[key.hash % num_buckets] << key.hash 
      @count += 1 
    end
  end

  def include?(key)
    @store.any? { |bucket| bucket.include?(key.hash)}
  end

  def remove(key)
    if self.include?(key)
      @store[key.hash % num_buckets].delete(key.hash)
      @count -= 1 
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    @store += Array.new(num_buckets) { Array.new }
  end
end
