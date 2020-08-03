# bundle exec rspec spec/p04_linked_list_spec.rb

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
    next_node = @next
    prev_node = @prev
    prev_node.next = next_node
    next_node.prev = prev_node
  end
end

class LinkedList
  include Enumerable

  attr_accessor :head, :tail #public accessors we added

  def initialize
    @head = Node.new(:head, :head)
    @tail = Node.new(:tail, :tail)
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    head.next
  end

  def last
    tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    self.each do |node|
      return node.val if node.key == key
    end
  end

  def include?(key)
    self.each do |node|
      return true if node.key == key
    end
    false
  end

  def append(key, val) #[head]-[first]-[tail]
    new_node = Node.new(key, val)
    previous = tail.prev
    previous.next = new_node
    tail.prev = new_node
    new_node.next = tail
    new_node.prev = previous
  end

  def update(key, val) #LinkedList.update << it has a place already in the list
    self.each do |node|
      return node.val = val if node.key == key
    end
  end

  def remove(key)
    self.each do |node|
      return node.remove if node.key == key
    end
  end

  def each
    node = first
    while node != tail
      yield node        #KEYWORD PARTY
      node = node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
