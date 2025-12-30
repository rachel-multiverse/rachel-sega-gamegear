# Sega Game Gear Rachel Client Makefile

ASM = pasmo
AFLAGS = --bin

SRC_DIR = src
BUILD_DIR = build

TARGET = $(BUILD_DIR)/rachel.gg

SRCS = $(SRC_DIR)/main.asm

.PHONY: all clean

all: $(BUILD_DIR) $(TARGET)
	@ls -la $(TARGET)
	@echo "Build complete: $(TARGET)"

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(TARGET): $(SRCS)
	cd $(SRC_DIR) && $(ASM) $(AFLAGS) main.asm ../$(TARGET)

clean:
	rm -rf $(BUILD_DIR)
