wires = []
wires[0] = (0...16).to_a.shuffle
wires[1] = (0...16).to_a.shuffle
wires[2] = (0...16).to_a.shuffle
hs = Hash.new
wires.each do |wire|
    for i in (0...16) do
        perm = wire.rotate(i)
        if hs.has_key?(perm) then
            puts "collision: #{perm.to_s}"
        end
        hs[perm] = 0;
    end
end

wires.each do |wire|
    p wire
    for i in (0...16) do
        puts "assign B[#{i}] = A[#{wire[i]}];"
    end
end
