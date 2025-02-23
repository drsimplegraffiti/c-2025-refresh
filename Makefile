# Define the compiler to use
CC = gcc

# Define compiler flags:
# -Wall    : Enable all standard warnings.
# -Wextra  : Enable additional warnings.
# -std=c99 : Use the C99 standard.
CFLAGS = -Wall -Wextra -std=c99

# Automatically find all .c source files in the current directory and all subdirectories.
# The $(shell ...) function runs the 'find' command in the shell.
SRCS = $(shell find . -name '*.c')

# Define the name of the output executable
TARGET = myProgram

# Default target: When you run 'make', this 'all' target is built.
all: $(TARGET)

# Rule to build the executable:
# This target depends on all the source files listed in SRCS.
# The command compiles all source files with the specified compiler flags and outputs the executable.
$(TARGET): $(SRCS)
	$(CC) $(CFLAGS) $(SRCS) -o $(TARGET)

# Clean target: Deletes the generated executable.
# Run this with 'make clean' to remove build artifacts.
clean:
	rm -f $(TARGET)

