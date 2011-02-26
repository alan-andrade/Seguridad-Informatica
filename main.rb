require './algorithms.rb'

encrypted = Algorithms::Playfair.encrypt('ballon','monarchy')
p encrypted
decrypted = Algorithms::Playfair.decrypt(encrypted)
p decrypted
