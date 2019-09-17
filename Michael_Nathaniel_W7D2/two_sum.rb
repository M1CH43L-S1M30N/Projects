def bad_two_sum?(arr, target)
    arr.each_with_index do |ele_1, idx_1|
        arr.each_with_index do |ele_2, idx_2|
             if idx_2 > idx_1
                return true if ele_1 + ele_2 == target
             end
        end
    end
    false
end

arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false

