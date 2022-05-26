require_relative 'ask.rb'
order = {}

loop do
    name = ask "Наимнование"
    break if name == "стоп"

    price = ask "Цена", Numeric
    qty = ask "Количество", Numeric

    order[name] = {qty: qty, price: price}

end

puts "Хэш заказа:"
puts order

puts "Итовая сумма по позиции:"
order.each do |key, value| 
    puts "#{key}: #{value[:qty]*value[:price]}"
end


total = order.map{|k,v| v[:price]*v[:qty]}.to_a.sum
puts "Итовая сумма по заказу: #{total}"