def cycle(wire)
    pos = 0
    pos = wire[pos]
    cnt = 1
    while pos != 0 do
        pos = wire[pos]
        cnt = cnt + 1
    end
    cnt
end

wires = []
for i in 0...8 do
    wire = (0...16).to_a.shuffle
    while cycle(wire) != 16 do
        wire = (0...16).to_a.shuffle
    end
    wires.push(wire.clone)
end

hs = Hash.new
wires.each do |wire|
    for i in (0...16) do
        perm = wire.rotate(i)
        if hs.has_key?(perm) then
            puts "collision: #{perm.to_s}"
        end
        hs[perm] = 0;
    end
    puts "//cycle: #{cycle(wire)}"
end

wires.each do |wire|
    puts "//#{wires.index wire}th: #{wire}"
    puts "module randomPermSeed#{wires.index wire}(A_all, B_all);"
    puts "    input [63:0] A_all;"
    puts "    output [63:0] B_all;"
    for i in (0...16) do
        puts "    assign B_all[#{i*4+3}:#{i*4}] = A_all[#{wire[i]*4+3}:#{wire[i]*4}];"
    end
    puts "endmodule"
end
