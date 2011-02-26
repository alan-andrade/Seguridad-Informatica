require './algorithms.rb'

encrypted = Algorithms::Playfair.encrypt('arriba el cruz azul','nextel')
p encrypted
decrypted = Algorithms::Playfair.decrypt(encrypted)
p decrypted
