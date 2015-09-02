MAIN = randomPermGen
BENCH = tb_randomPermGen
SOURCES = *.v
VERILOG = iverilog
WAVE = gtkwave

.PHONY: all
all: $(MAIN).out

$(MAIN).out:
	$(VERILOG) -o $(MAIN).out -s $(BENCH) $(SOURCES)

.PHONY: wave
wave: $(MAIN).out
	./$(MAIN).out
	$(WAVE) $(MAIN).vcd > /dev/null 2>&1 &

.PHONY: clean
clean:
	rm -rf *.vcd *.out
