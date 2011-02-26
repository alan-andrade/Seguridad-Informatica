require './algorithms.rb'

encrypted = Algorithms::Playfair.encrypt('lucy in the sky with diamonds', 'monarchy')
p encrypted
