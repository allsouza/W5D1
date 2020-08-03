# bundle exec rspec spec/p03_hash_set_spec.rb

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key) #
    if !include?(key) #O(1) - iterate through bucket ~1 item per bucket
      if @count < num_buckets #O(1) operation - check if count is less than our num buckets
          self[key] << key  #O(1) - if count < num_buckets then we insert 
        else #self[num % num_buckets] << num
          resize! #O(n) - amortization! big investment! if count > num_buckets we resize! then we insert
          self[key] << key #O(1)
        end
      @count += 1 #O(1)  #if we did <= on 13, then should put this prior to conditional
    end
  end

  def include?(key)
      self[key].include?(key)
  end

  def remove(key)
    if include?(key)
      self[key].delete(key) 
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[ num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize! #O(n)
    new_size = num_buckets * 2 #O(1)
    new_store = Array.new(new_size) {Array.new} #O(1)
    @store.each do |bucket| #O(n) - iterate through all items, so n times
      bucket.each { |item| new_store[item.hash % new_size] << item } #O(1)
    end
    @store = new_store
  end
  
end
