module Algorithms
  class DES
    class Block
      attr_reader :string, :bit_array
      def initialize(input)
        if input.is_a?(String)
          raise "El texto debe contener 8 caracteres" unless input.size.eql?(8)
          @string    = input
          @bit_array = input.unpack('B*').join.split('').collect{|b| b.to_i}
        elsif input.is_a?(Array)
          raise "El arreglo que ingresaste no tiene 64 bits." unless input.size.eql?(64)          
          @string    = input.join.chars.to_a.pack('B*')
          @bit_array = input
        end
      end
    end
  end
end
