require 'pp'
used_letters = []

keyword = "playfair"
keyword = keyword.gsub(/j/, 'i')
p keyword
alphabet  = ("a".."z").to_a - keyword.split(//) - ['j'] # Quitamos la `j` porque se toma como `i`

matrix  = [
            Array.new(5),
            Array.new(5),
            Array.new(5),
            Array.new(5),
            Array.new(5)
          ]

## Llenado de matriz
matrix.each_index do |index|
  matrix[index].each_index do |inner_index|
    begin
      letter  = (keyword.slice!(0) || alphabet.delete_at(0))
    end while (not  letter.nil?           and 
               not  used_letters.empty?   and 
               used_letters.include?(letter))                      
    used_letters  <<  letter            # la agregamos al arreglo de letras usadas.
    matrix[index][inner_index] = letter # y llenamos la matriz.      
  end
end

pp matrix

print "Escribe el mensjae a encriptar: "
msg = "balloon"
pp msg

## Primera Regla
msg.split(//).each_index do |index|
  mini_pair = msg[index..index+1]
  msg.insert(index+1, 'x') if index.even? and mini_pair.size > 1 and mini_pair[0]==mini_pair[1]  
end
msg+='x' if msg.size.odd?
p msg
