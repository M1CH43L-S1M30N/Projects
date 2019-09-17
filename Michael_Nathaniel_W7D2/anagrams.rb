def first_anagram?(str_1, str_2)
  str_perm = str_1.split("").permutation.to_a.map(&:join).include?(str_2)
end



def second_anagram?(str_1, str_2)
    str_arr_1 = str_1.split('')   
    str_arr_2 = str_2.split('')
    str_arr_1.each do |char|
        idx = str_arr_2.index(char)
        return false if idx == nil
        str_arr_2.delete_at(idx)
    end
    str_arr_2.empty?
end

 #nlog(n)
def third_anagram?(str_1, str_2)
  str_1.split("").sort == str_2.split("").sort
end

def fourth_anagram?(str_1, str_2)
  hash = Hash.new(0)
  str_1.each_char { |char| hash[char] += 1 }
  str_2.each_char { |char| hash[char] -= 1 }
  hash.values.all? { |num| num == 0 }
end

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true
p fourth_anagram?("flow", "wolf")      #=> true
p fourth_anagram?("cautionedcautioned", "auctionedauctioned")  #=> true