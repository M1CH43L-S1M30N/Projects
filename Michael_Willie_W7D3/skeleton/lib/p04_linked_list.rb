require "byebug"
class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
attr_accessor :head, :tail

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
    @count = 0
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    # debugger
    @head.next
  end
#tail = next
#head = prev
  def last
    @tail.prev
  end

  def empty?
    @count == 0
  end

  def get(key)
    self.each do |node| 
      return node.val if node.key == key 
    end
  end

  def include?(key)
    self.any? { |node| node.key == key }
  end

  def append(key, val)
    new_node = Node.new(key, val)
    new_node.next = @tail
    new_node.prev = @tail.prev
    new_node.next.prev = new_node
    new_node.prev.next = new_node
    @count += 1
  end

  def update(key, val)
    self.each do |node| 
      if node.key == key
        node.val = val 
      end
    end
  end

  def remove(key)
    found_node = nil 
    self.each do |node| 
      found_node = node if node.key == key
    end
    
    found_node.prev.next = found_node.next 
    found_node.next.prev = found_node.prev 
    
  end

  def each(&prc)
    #prev new_node next 
    current_node = @head.next 
    while !current_node.next.nil? 
      prc.call(current_node)
      current_node = current_node.next 
    end

  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
