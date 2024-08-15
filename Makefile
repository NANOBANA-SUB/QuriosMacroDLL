# Compiler and linker
CC = g++
LD = g++

# Target DLL name and build directory
TARGET_DIR = build
TARGET = $(TARGET_DIR)/simulate_keypress.dll

# Source files
SRCS = src/SimulateKeypress.cpp
HDRS = src/SimulateKeypress.h

# Object files (in build directory)
OBJS = $(SRCS:.cpp=.o)
OBJS := $(addprefix $(TARGET_DIR)/, $(notdir $(OBJS)))

# Test files
TEST_SRCS = test/test_main.cpp
TEST_OBJS = $(addprefix $(TARGET_DIR)/, $(notdir $(TEST_SRCS:.cpp=.o)))
TEST_EXEC = $(TARGET_DIR)/test_main.exe

# Compiler flags
CFLAGS = -Wall -O2 -DBUILD_DLL  # BUILD_DLL を定義

# Linker flags
LDFLAGS = -shared -o $(TARGET) -Wl,--out-implib,$(TARGET_DIR)/libsimulate_keypress.a

# Build the DLL and test executable
all: $(TARGET_DIR) $(TARGET) $(TEST_EXEC)

# Create build directory
$(TARGET_DIR):
	mkdir -p $(TARGET_DIR)

# Link object files into the DLL
$(TARGET): $(OBJS)
	$(LD) $(LDFLAGS) $(OBJS) -o $(TARGET)

# Build the test executable
$(TEST_EXEC): $(TEST_OBJS) $(TARGET)
	$(CC) $(TEST_OBJS) -L$(TARGET_DIR) -lsimulate_keypress -o $(TEST_EXEC)

# Compile source files into object files (build/ directory)
$(TARGET_DIR)/%.o: src/%.cpp $(HDRS)
	$(CC) $(CFLAGS) -c $< -o $@

# Compile test files into object files (build/ directory)
$(TARGET_DIR)/%.o: test/%.cpp
	$(CC) $(CFLAGS) -c $< -o $@

# Clean up build files
clean:
	rm -rf $(TARGET_DIR)

.PHONY: all clean
