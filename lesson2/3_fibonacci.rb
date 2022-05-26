def get_fib arr
    raise "Wrong value" if !arr

    return 0 if arr.count == 0
    
    return 1 if arr.count == 1

    return arr[-1]+arr[-2] if arr.count>1
end


result = []
#это вариант, если  считать, что надо, чтобы последнее число финоаччи было меньше 100
while  
    new_value =  get_fib(result)
    break if new_value >100
    result << new_value
end

puts result



result2 = []
#это вариант, если количество чисел фибоначчи должно быть 100
(0..100).each do |j|
    result2 << get_fib(result2)
end

puts result2


