$:.unshift(File.dirname(__FILE__))

[ 'lib/playfair/playfair.rb', 'lib/des/des.rb' ].each do |file|
  require file
end
