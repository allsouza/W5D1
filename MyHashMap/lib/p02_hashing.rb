# #AS drive, BB navigate

# class Integer
#   # Integer#hash already implemented for you
# end

# class Array
#   def hash
#     self.each do |ele|

#     end
#   end
# end

# class String #hEllO 0306 / 3228 / 6867 / 7149
#   def hash
#     result = ""
#     alpha = ('a'..'z').to_a + ('A'..'Z').to_a
#     self.each_char do |c|
#       i = alpha.index(c)
#       i.hash.to_s
#       result += i[0..3]
#     end
#   end
# end

# # [3 digs first letter][total 4 grab][3 digs last letter]
# # 237 252102 328
# -237301181947384/5337
# 384321272475356/8120
# 190843228768674/7149
# 190843228768674/1140 = > 6
# 328616062844355/3324 =>12


# class Hash
#   # This returns 0 because rspec will break if it returns nil
#   # Make sure to implement an actual Hash#hash method
#   def hash
#     0
#   end
# end
