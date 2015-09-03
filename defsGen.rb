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
puts (0...16).map {|i|
    "4'b" + i.to_s(2).rjust(4,'0')
}.join(', ')

for i in (0...8) do
    j = 7 - i
    puts "rotateMapper16 rmap#{i}(.A_all(rmapin#{i}), .B_all(randwirein#{i}), .shift(rotaryPos[#{i*4+3}:#{i*4}]));"
    puts "randomPerm#{i} rperm#{i}(.A_all(randwirein#{i}), .B_all(rmapin#{i+1}));"
end

puts (0...16).to_a.reverse.map {|i|
    "seq_all[#{i*4+3}:#{i*4}]"
}.join(', ')
