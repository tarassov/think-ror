require_relative 'ask.rb'

def ideal height
    (height -110)*1.15        
end


name = ask "Назовитесь", String

height = ask "Каков ваш рост", Numeric

weight = ideal height
if weight <= 0
    puts "#{name}, Ваш вес уже оптимальный"
else
    puts "#{name}, Ваш идеальный вес - #{weight}"
end