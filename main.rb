require './algorithms.rb'

#encrypted = Algorithms::Playfair.encrypt('arriba el cruz azul','nextel')
#p encrypted
#decrypted = Algorithms::Playfair.decrypt(encrypted)
#p decrypted

plaintext = Algorithms::DES::Block.new('12345678')
secretkey = Algorithms::DES::Block.new('xsecretx')

Algorithms::DES.new(plaintext, secretkey)

