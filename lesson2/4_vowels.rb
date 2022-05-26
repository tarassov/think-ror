vowels = ['a', 'e', 'i', 'o', 'u']

h = {}
i = 1
('a'..'z').each do |letter|
    h[letter.to_s] = i if vowels.include?(letter)
    i+=1
end

puts h