puts "Введите 3 коэффициента"

require_relative 'ask.rb'

def solve a,b,c
  d = b*b-4*a*c
  if d<0
    puts "Корней нет"
  elsif d == 0
    puts "Корень #{-b/2*a}"
  else
    puts "Дискриминант: #{d}"
    puts "Корень 1: #{(-b+Math.sqrt(d))/(2*a)}"
    puts "Корень 2: #{(-b-Math.sqrt(d))/(2*a)}"
  end 
end

a = ask "a = ", Numeric, true
b = ask "b = ", Numeric, true
c = ask "c = ", Numeric, true

solve a,b,c
