CXX := g++
CXXFLAGS := -pedantic -g -Wextra -Wall

SRC_DIR := src
BUILD_DIR := build
DIST_DIR := dist

SRCS := $(wildcard $(SRC_DIR)/*.cxx)
OBJS := $(patsubst $(SRC_DIR)/%.cxx,$(BUILD_DIR)/%.o,$(SRCS))
TARGET := $(DIST_DIR)/cli.gg

.PHONY: all run clean build

all: build $(TARGET)

run: $(TARGET)
	@./$(TARGET)

build:
	@mkdir -p $(BUILD_DIR) $(DIST_DIR)

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cxx | build
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	@rm -rf $(BUILD_DIR) $(DIST_DIR)
