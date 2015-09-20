MAIN = randomPerm16
BENCH = tb_randomPerm16
SOURCES = *.v
VERILOG = iverilog
WAVE = gtkwave

.PHONY: all
all: $(MAIN).out

.PHONY: wave
wave: $(MAIN).out
	./$(MAIN).out
	$(WAVE) $(MAIN).vcd > /dev/null 2>&1 &

$(MAIN).out: $(SOURCES)
	$(VERILOG) -o $(MAIN).out -s $(BENCH) $(SOURCES)

.PHONY: clean
clean:
	rm -rf *.vcd *.out
