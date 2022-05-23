def is_right a,b,c
    sides = [a, b, c].sort
    return sides[2]*sides[2] == sides[1]*sides[1]+sides[0]*sides[0]
end

require_relative 'ask.rb'

def is_isosceles a,b,c
    a==b || b ==c || a==c
end

def is_equilateral a,b,c
    a == b && b == c
end

puts "Введите стороны треугольника"

a = ask "Сторона 1 = ", Numeric
b = ask "Сторона 2 = ", Numeric
c = ask "Сторона 3 = ", Numeric

if is_right(a,b,c) 
    puts "Треугольник прямоугольный"    
elsif is_equilateral(a,b,c)
    puts "Треугольник равносторонний"
elsif is_isosceles(a,b,c)
    puts "Треугольник равнобедренный"
else
    puts "Просто треугольник"
end     
