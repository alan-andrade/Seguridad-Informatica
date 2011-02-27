require 'lib/des/block.rb'

module Algorithms
  class DES
    attr_reader :key, :data
    def initialize(data,  key)
      unless data.is_a?(Algorithms::DES::Block) and key.is_a?(Algorithms::DES::Block)  
        raise "DES solo acepta objetos de tipo DES::BLOCK"
      end
      @key  = key
      @data = data
    end
    
    def encrypt
      
    end
  end
end
