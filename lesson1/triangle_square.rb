
require_relative 'ask.rb'

def square a,h
    return 0.5*a*h
end
puts "Рассчет площади теругольника"
a = ask "Основание=", Numeric
h = ask "Высота=", Numeric

puts "Площадь треугольника #{square(a,h)}"