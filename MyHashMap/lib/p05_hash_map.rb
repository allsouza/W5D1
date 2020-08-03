require_relative 'p04_linked_list'
# bundle exec rspec spec/p05_hash_map_spec.rb

# {bucket => List}
class HashMap
  include Enumerable
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  #>>>>>
  def include?(key)
    bucket(key).include?(key) #calling include method on the List #CHANGED TO BUCKET
  end

  def set(key, val) #[]=
      # self[key] = val
      # list = @store[key.hash % num_buckets] #self[key] #check if key exists
    list = bucket(key)
    resize! if count >= num_buckets
    if list.include?(key) 
        list.update(key, val) #if it exists, update << we have to iterate through a list, O(n)
        #insertion is O(n) because of this iteration, but we can change that in our cache...to be continued
    else
      list.append(key, val)   #if not, append
      @count += 1
    end
  end

  def get(key)
    bucket(key).get(key)
  end

  #>>>>>>
  def delete(key)
    bucket(key).remove(key)
    @count -= 1
  end

  def each #{bucket=>list, bucket=>list}
    @store.each do |list|
      list.each do |node|
        yield(node.key, node.val)
      end
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get #HashMap[key] should yield it's value

  #>>>>>>>>>
  # def [](key)
  #   # @store[key.hash % num_buckets].get(key) #returns linked list at the key given
  #   bucket(key).get(key)
  # end

  alias_method :[]=, :set

  #>>>>>>>>>>>>>
  # def []=(key, val)
  #   # list = @store[key.hash % num_buckets] #self[key] #check if key exists
  #   list = bucket(key)
  #   resize! if count >= num_buckets
  #   if list.include?(key) 
  #       list.update(key, val) #if it exists, update << we have to iterate through a list, O(n)
  #       #insertion is O(n) because of this iteration, but we can change that in our cache...to be continued
  #   else
  #     list.append(key, val)   #if not, append
  #     @count += 1
  #   end
  # end

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_size = num_buckets * 2 
    new_store = Array.new(new_size) {LinkedList.new} 
    @store.each do |list| 
      list.each do |link| 
        k = link.key
        v = link.val
        new_store[k.hash % new_size].append(k, v) 
      end #O(1)
    end
    @store = new_store
  end

  def bucket(key)
    @store[key.hash % num_buckets]
    # optional but useful; return the bucket corresponding to `key`
  end
end