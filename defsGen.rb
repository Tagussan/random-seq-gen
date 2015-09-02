puts (0...16).map {|i|
    "A_#{i}"
}.join(', ')
puts (0...16).map {|i|
    "B_#{i}"
}.join(', ')
puts (0...16).map {|i|
    ".A_#{i}(A_#{i})"
}.join(', ')
puts (0...16).map {|i|
    ".B_#{i}(B_#{i})"
}.join(', ')
for i in (0...16) do
    puts "rotateSelect16 rot#{i}(.A_all(A_all), .shift(4'd#{i} + shift), .res(B_all[#{i*4+3}:#{i*4}]));"
end
