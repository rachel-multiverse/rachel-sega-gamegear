# Sega Game Gear Rachel Client Makefile

ASM198X ?= asm198x
PASMO ?= pasmo
PYTHON ?= python3

SRC_DIR = src
BUILD_DIR = build

TARGET = $(BUILD_DIR)/rachel.gg

SRCS = $(wildcard $(SRC_DIR)/*.asm $(SRC_DIR)/net/*.asm)

.PHONY: all clean check reference-parity

all: $(BUILD_DIR) $(TARGET)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(TARGET): $(SRCS) | $(BUILD_DIR)
	$(ASM198X) --dialect pasmo -I $(SRC_DIR) $(SRC_DIR)/main.asm -o $@
	$(PYTHON) tools/finalize_rom.py $@

reference-parity: $(TARGET)
	cd $(SRC_DIR) && $(PASMO) --bin main.asm ../$(BUILD_DIR)/reference.gg
	$(PYTHON) tools/finalize_rom.py $(BUILD_DIR)/reference.gg
	cmp $(TARGET) $(BUILD_DIR)/reference.gg

check: reference-parity
	$(PYTHON) tests/verify_rom.py $(TARGET)

clean:
	rm -rf $(BUILD_DIR)
