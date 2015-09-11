perm3 = [0,1,2].permutation(3).to_a
ratio = 128.0 / 6.0
for i in 0 ... perm3.length
    print " else " if i != 0
    puts "if (#{(i * ratio).floor} <= random && random < #{((i + 1) * ratio).floor}) begin"
    for j in 0 ... perm3[i].length
        puts "    Y_all[#{perm3[i][j]+1}:#{perm3[i][j]}] <= X_all[#{j+1}:#{j}];"
    end
    print "end"
end
puts ""
