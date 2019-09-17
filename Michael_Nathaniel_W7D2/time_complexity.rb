require "byebug"

# time compexlity = O(n^2)
#

def my_min(list)
    min = list[0]
    list.each do |ele_1|
        list.each do |ele_2|
            if ele_1 < ele_2
                min = ele_1 if ele_1 < min
            else
                min = ele_2 if ele_2 < min
            end
        end
    end
    min
end


# time complexity = O(n)

def my_min_fast(list)
    # min = list.shift
    # list.each { |ele| min = ele if ele < min } 
    # min

    i = 0 
    min = list[0]
    while i < (list.length - 1)
       min = list[i] if list[i] < list[i + 1] && (list[i] < min)
       i += 1
    end
    min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90, -20]
# p my_min_fast(list)

# time complexity = O(n^2)

def lcs(list)
    subs_arr = []
    list.each_with_index do |ele_1, idx_1|
         list.each_with_index do |ele_2, idx_2|
            if idx_2 > idx_1 
                subs_arr << list[idx_1..idx_2]
            end
         end
    end
    max = subs_arr.shift
        subs_arr.each { |ele| max = ele if ele.sum > max.sum } 
    max
end

# time complexity = O(n)



def lcs_fast(list)
    local_sum = 0
    global_sum = 0
    list.each do |ele|
        local_sum += ele
        if local_sum > global_sum
            global_sum = local_sum
        end
        if local_sum < 0
            local_sum = 0
        end
    end
    global_sum
end
list = [2, 3, -6, 7, -6, 7]
p lcs_fast(list)






