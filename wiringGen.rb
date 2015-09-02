wires = []
for i in (0...8) do
    wires.push (0...16).to_a.shuffle
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
end

wires.each do |wire|
    puts "#{wires.index wire}th: #{wire}"
    for i in (0...16) do
        puts "assign B_#{i} = A_#{wire[i]};"
    end
end
