require './algorithms.rb'

encrypted = Algorithms::Playfair.encrypt('tetsto plano jovenes')
p encrypted
decrypted = Algorithms::Playfair.decrypt(encrypted)
p decrypted

plaintext = Algorithms::DES::Block.new('abcdefgh')
secretkey = Algorithms::DES::Block.new('xsecretx')

ready_to_encrypt  = Algorithms::DES.new(plaintext, secretkey)
p ready_to_encrypt
crypted = ready_to_encrypt.encrypt
p crypted
decrypted = Algorithms::DES.new(crypted, secretkey)
p decrypted.decrypt

