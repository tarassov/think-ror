def numeric (value)
    Float(value) != nil rescue false
end

def ask (question, type =String, negative = false)
    
    puts question
    res = gets.chomp

    if type == String
       return res.strip  
    else 
       if !numeric(res) || ( res.to_f <=0 && !negative) 
          puts "Неверный ввод"
          return  ask question, type, negative
       else
         return res.to_i if type == Integer
         return  res.to_f   
       end               
    end  

end
