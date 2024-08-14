# Makefile to build a Windows DLL with GCC

# Compiler and linker
CC = g++
LD = g++

# Target DLL name
TARGET = simulate_keypress.dll

# Source files
SRCS = src\SimulateKeypress.cpp

# Object files (same as source but with .o extension)
OBJS = $(SRCS:.cpp=.o)

# Compiler flags
CFLAGS = -shared -Wall -O2

# Linker flags
LDFLAGS = -shared -o $(TARGET) -Wl,--out-implib,libsimulate_keypress.a

# Build the DLL
all: $(TARGET)

# Link object files into the DLL
$(TARGET): $(OBJS)
	$(LD) $(LDFLAGS) $(OBJS) -o $(TARGET)

# Compile source files into object files
%.o: %.cpp
	$(CC) $(CFLAGS) -c $< -o $@

# Clean up build files
clean:
	rm -f $(OBJS) $(TARGET) libsimulate_keypress.a

.PHONY: all clean
