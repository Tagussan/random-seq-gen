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
