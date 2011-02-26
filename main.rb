require './algorithms.rb'

encrypted = Algorithms::Playfair.encrypt('ballon','monarchy')
p encrypted
