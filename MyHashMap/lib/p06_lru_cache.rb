require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  def initialize(max, prc) # x => Proc.new { |x| x ** 2 }
    @map = HashMap.new #{key => LinkList.get(key), }
    @store = LinkedList.new #this is where our links remember who's prev, next
    @max = max #how many k-v pairs we have
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
   if !@map.include?(key)
      @prc.call(key) 
      remove.(last
   else

#     if key isn't in out hash, prc.call(key) --> should call the given proc for uncached inputs 

#     should eject least recently used items out of cache 
#     should update the map to point at the new node 
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
  end

  def eject!
    last = @store.last
    @store.remove(last.key)
  end
end


#we have access to:

# class Node
#   attr_reader :key
#   attr_accessor :val, :next, :prev
#   def initialize(key = nil, val = nil)
#   def to_s
#   def remove
# end

# class LinkedList
#   include Enumerable

#   attr_accessor :head, :tail #public accessors we added

#   def initialize
#     @head = Node.new(:head, :head)
#     @tail = Node.new(:tail, :tail)
#     @head.next = @tail
#     @tail.prev = @head
#   end
#   def [](i)
#   def first > head.next
#   def last > tail.prev
#   def empty?
#   def get(key)
#   def include?(key)
#   def append(key, val) #[head]-[first]-[tail]
#   def update(key, val) #LinkedList.update << it has a place already in the lis
#   def remove(key)
#   def each


# # bundle exec rspec spec/p05_hash_map_spec.rb

# # {bucket => List}
# class HashMap
#   include Enumerable
#   attr_accessor :count

#   def initialize(num_buckets = 8)
#     @store = Array.new(num_buckets) { LinkedList.new }
#     @count = 0
#   end#>>>>>
#   def include?(key)
#   def set(key, val) #[]=
#   def get(key)
# def delete(key)
#   def each #{bucket=>list, bucket=>list}
#  alias_method :[]=, :set
 