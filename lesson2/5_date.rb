require_relative 'ask.rb'
monthes = [31, 28, 31,30,31, 30, 31, 31,30,31,30,31]


def is_leap year
    if year % 4  == 0
        if year % 100 == 0
            if year % 400 == 0
                return 1
            else
                return 0
            end
        else
            return 1
        end
    else
        return 0
    end
end



day = ask "День=", Integer
month = ask "Месяц=", Integer
year = ask "Год=", Integer

result = 0

(1..12).each do |m|
    if month == m
        result  += day
        break
    else
        if m == 2
            result += 28 + is_leap(year)            
        else
            result += monthes[m-1]
        end
    end
end

puts "Порядковый номер  - #{result}"