# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra -Werror

# Cross-compiler setup
ifdef CROSS_COMPILE
    CC = $(CROSS_COMPILE)gcc
endif

# Targets
TARGET = writer
SRC = writer.c
OBJS = writer.o

# Default target
all: $(TARGET)

# Build target
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS)

# Object file generation
%.o: %.c
	$(CC) $(CFLAGS) -c $(SRC) -o $(OBJS)

# Clean target
clean:
	rm -f $(TARGET) $(OBJS)

.PHONY: all clean