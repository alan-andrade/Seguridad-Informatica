module Algorithms
  class Playfair
    class << self # hereda de si mismo, definimos metodos de Clase, no de instancia    
      # Encrypt a msg using playfair cyper method.
      # You need to give the msg, and the keyword with wich
      #  will be used to encrypt.
      def encrypt(msg, keyword=nil)          
        # Ensure arguments have no spaces and exists
        sanitize_args(msg,keyword)
        
        # Define and fill our matrix
        define_matrix
       
        # Apply first rule to the message
        first_rule       
        
        # Encrypt the message
        encryption_decryption(:encrypt)             
      end
      
      def decrypt(msg)
        sanitize_args(msg)
        define_matrix
        first_rule
        encryption_decryption(:decrypt)
      end
      
      private
        def sanitize_args(msg, keyword=nil)
          raise ArgumentError, "Un argumento esta vacio" if msg.empty?
          keyword = ask_keyword if keyword.nil?
          @msg, @keyword  =   msg.delete(" "),  keyword.delete(" ")   #get rid of spaces and `j`
          [@msg, @keyword].each{ |word| word.gsub!(/j/, 'i') }
        end
        
        def ask_keyword
          p "Enter passphrase: "
          gets.chomp
        end
        
        def define_matrix
          # Creates a 5x5 matrix that will help for the encryption and decription.
          @matrix = [ Array.new(5), Array.new(5), Array.new(5),
                      Array.new(5), Array.new(5) ]
          fill_matrix
        end
        
          def fill_matrix
            # change every 'j' with and 'i'
            # DEPRECATED: Get rid of 'j' in sanitize args.
            # keyword   = @keyword.gsub(/j/, 'i')            
            keyword = @keyword
            # define an alphabet
            alphabet  = ("a".."z").to_a - keyword.split(//) - ['j'] # Quitamos la `j` porque se toma como `i`
            used_letters = []
            
            ## Iterate over ALL the key matrix
            @matrix.each_index do |index|
              @matrix[index].each_index do |inner_index|
                # do/while for select either a character from the keyword, or the alphabet.
                begin
                  letter  = (keyword.slice!(0) or alphabet.delete_at(0))
                end while (not  used_letters.empty?   and 
                           used_letters.include?(letter))
                used_letters  <<  letter            
                @matrix[index][inner_index] = letter
              end
            end
          end
        
        # Apply the fist rule to the encryption process.
        def first_rule                    
          @msg.each_pair do |first, second, index|            
            @msg.insert(index, 'x') if first == second
          end
          #Add an X to the end if the msg is odd.
          @msg += 'x' if @msg.size.odd?   
        end
        
        # Play with the matrix applying all the rules that this algorithm has
        # in order to finish with the encryption
        def encryption_decryption(action)
          @encrypted_msg  = ''
          
          @msg.each_pair do |first, second, index|
            # Get coords for each pair of chars.            
            a_coords  = find_char_in_matrix(first)
            b_coords  = find_char_in_matrix(second)
            
            # Apply rules of movement in the key matrix
            movement_in_matrix(a_coords,b_coords, action)
          end
          
          @encrypted_msg
        end
        
        def find_char_in_matrix(char)
          x , y = nil , nil
          y = @matrix.find_index{|first| x = first.find_index{|second| second == char} }
          return {:x=>x, :y=>y} if not x.nil? and not y.nil?
          raise "No existe la letra en la matriz de llave"
        end
        
        def movement_in_matrix(a_coords,b_coords, action)
          # Keep ALL the coords in a hash to facilitate manipulation.
          coords  = Hash.new()
          coords[:x1],  coords[:y1] = a_coords[:x],  a_coords[:y]
          coords[:x2],  coords[:y2] = b_coords[:x],  b_coords[:y]
          movements(coords,action)
        end 
           
        def movements(coords,action)
          same_row(coords,action)     if coords[:y1] == coords[:y2]
          same_column(coords,action)  if coords[:x1] == coords[:x2]
          cross(coords,action)        if coords[:x1] != coords[:x2] and coords[:y1] != coords[:y2]
        end    
        def same_row(coords, action)
          rotate = @matrix[coords[:y1]].rotate      if action==:encrypt   # Rotate Right
          rotate = @matrix[coords[:y1]].rotate(-1)  if action==:decrypt   # Rotate Left
          @encrypted_msg += rotate[coords[:x1]] + rotate[coords[:x2]]
        end
        
        def same_column(coords, action)
          rotate  = @matrix.rotate      if action ==  :encrypt                 # Rotate Down
          rotate  = @matrix.rotate(-1)  if action ==  :decrypt                 # Rotate Up
          @encrypted_msg  +=  rotate[coords[:y1]][coords[:x1]] + rotate[coords[:y2]][coords[:x2]]
        end
        
        def cross(coords, action)          
          @encrypted_msg += @matrix[coords[:y1]][coords[:x2]] + @matrix[coords[:y2]][coords[:x1]]
        end
        
     end # class methods
  end # class
end # module


class String
  def each_pair
    i = 0
    while i <= size-1
      yield(self[i], self[i+1], i)
      i+=2
    end
  end
end
