module Algorithms
  class DES
    class Block
      attr_reader :string, :bit_array
      def initialize(input)
        raise "El texto debe contener 8 caracteres" unless input.size.eql?(8)
        @string    = input
        @bit_array = input.unpack('B*').join.split('').collect{|b| b.to_i}
      end
    end
  end
end
