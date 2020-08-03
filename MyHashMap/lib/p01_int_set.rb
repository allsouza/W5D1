# bundle exec rspec spec/p01_int_set_spec.rb`
require "byebug"

class MaxIntSet

  attr_reader :store

  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num) #go to index, set to true
    raise "Out of bounds" if !is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num > 0 && num <= @store.length
  end

  # def validate!(num)
  # end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num) 
    self[num] << num 
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num) #returns subarray index for the given num
    @store[num % 20]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new } #[ [b1: i,i2,i3], [b2], [b3], ..[b20]      ]
    @count = 0 #each time we insert(num), we count += 1, we redestribute all elements
  end

  def insert(num)
    if !include?(num)
        if @count < num_buckets #check if count is less than our num buckets
          self[num] << num  #if count < num_buckets then we insert 
        else #self[num % num_buckets] << num
            resize! #if count > num_buckets we resize! then we insert
            self[num] << num
        end
        @count += 1
    end
  end

  def remove(num)
    if include?(num)
      self[num].delete(num) 
      @count -= 1
    end
  end

  def include?(num)
    # debugger
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets #if this exceeds 20, redistribute & add 20
    @store.length
  end

  def resize! #doubles size of current store
    # num_buckets.times { @store << Array.new }
    new_size = num_buckets * 2 #O(1)
    new_store = Array.new(new_size) {Array.new} #O(1)
    @store.each do |bucket|
      bucket.each { |item| new_store[item % new_size] << item } #new_store[item % new_size] = item }
    end
    @store = new_store
  end
end
