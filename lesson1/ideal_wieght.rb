def ask question, type
    
    puts question
    res = gets.chomp

    if type == String
       return res         
    else 
       num = res.to_i
       if num <=0 
          puts "Неверный ввод"
          return  ask question, type
       else
          return num   
       end               
    end  

end

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