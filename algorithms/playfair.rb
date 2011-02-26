module Algorithms
  class Playfair
    class << self # hereda de si mismo, definimos metodos de Clase, no de instancia    
      # Encrypt a msg using playfair cyper method.
      # You need to give the msg, and the keyword with wich
      #  will be used to encrypt.
      def encrypt(msg, keyword)          
        # Ensure arguments have no spaces and exists
        sanitize_args(msg,keyword)
        
        # Define and fill our matrix
        define_matrix
       
        # Apply first rule to the message
        first_rule       

        for char  in @msg.each_char
          x , y = 0 , 0
          x = @matrix.find_index{|first| y = first.find_index{|second| second == char} }
          puts "#{char}: #{x}, #{y}"
        end
      end
      
      private
        def sanitize_args(msg, keyword)
          raise ArgumentError if msg.empty? or keyword.empty?
          @msg, @keyword  =   msg.delete(" "),  keyword.delete(" ")   #get rid of spaces
        end
        
        def define_matrix
          # Creates a 5x5 matrix that will help for the encryption and decription.
          @matrix = [ Array.new(5), Array.new(5), Array.new(5),
                      Array.new(5), Array.new(5) ]
          fill_matrix
        end
        
        def fill_matrix
          keyword = @keyword.gsub(/j/, 'i')
          alphabet  = ("a".."z").to_a - keyword.split(//) - ['j'] # Quitamos la `j` porque se toma como `i`
          used_letters = []
          
          ## Llenado de matriz
          @matrix.each_index do |index|
            @matrix[index].each_index do |inner_index|
              begin
                letter  = (keyword.slice!(0) || alphabet.delete_at(0))
              end while (not  letter.nil?           and 
                         not  used_letters.empty?   and 
                         used_letters.include?(letter))                      
              used_letters  <<  letter            # la agregamos al arreglo de letras usadas.
              @matrix[index][inner_index] = letter # y llenamos la matriz.      
            end
          end
        end
        
        # Apply the fist rule to the encryption process.
        
        def first_rule
          msg_as_array  =   @msg.split(//)  # original message as an array of each char. Eg. ['h', 'o', 'l', 'a']
          msg_as_array.each_index do |index|
            char_pair = @msg[index..index+1]
            @msg.insert(index+1, 'x') if  index.even?         and     # insert X's where two chars are repeated.
                                          char_pair.size > 1  and 
                                          char_pair[0]==char_pair[1]  
          end
          
          @msg+='x' if @msg.size.odd?   #Add an X to the end if the msg is odd.
        end
        
     end # class methods
  end # class
end # module
