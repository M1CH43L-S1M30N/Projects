require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_accessor :count, :num_buckets

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
    @num_buckets = num_buckets
  end

  def include?(key)
    bucket = @store[key.hash % @num_buckets]
    bucket.include?(key)
  end

  def set(key, val)
    bucket = @store[key.hash % @num_buckets]
    if bucket.include?(key)
      @store[key.hash % num_buckets].update(key, val)
    else
      resize! if @count == @num_buckets
      @store[key.hash % num_buckets].append(key, val)
      @count += 1
    end
  end

  def get(key)
    bucket = @store[key.hash % @num_buckets]
    bucket.get(key)
  end

  def delete(key)
    bucket = @store[key.hash % @num_buckets]
    bucket.remove(key)
    @count -= 1
  end

  def each(&prc)
    i = 0
    while i < num_buckets
      @store[i].each do |node| 
        prc.call(node.key, node.val)
      end
      i += 1
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    @store += Array.new(num_buckets) { LinkedList.new }
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
