CC = ghdl
OPT = -fexplicit --ieee=synopsys
STOPTIME = 10us
RUNOPT = --stop-time=$(STOPTIME)
SOURCE = u232c.vhd sub_top.vhd top_tb.vhd
TARGET = top_tb.vcd

all: $(TARGET)
	gtkwave $(TARGET) &

$(TARGET): $(SOURCE)
	$(CC) -a $(OPT) $(SOURCE); \
	$(CC) -e $(OPT) $(TARGET:.vcd=); \
	$(CC) -r $(OPT) $(TARGET:.vcd=) --vcd=$(TARGET) $(RUNOPT)

clean:
	rm -rf *.cf *.vcd
