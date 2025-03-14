CC = g++
CFLAGS = -Wall -Wextra -O2 -std=c++11
LDFLAGS = -lprometheus-cpp

SRCS = Fibi.cpp
OBJS = $(SRCS:.cpp=.o)
TARGET = fibonacci

# Default target
all: $(TARGET) install clean

# Build the target
$(TARGET): $(OBJS)
	$(CC) $(OBJS) -o $(TARGET) $(LDFLAGS)

# Compile source files into object files
%.o: %.cpp
	$(CC) $(CFLAGS) -c $< -o $@

# Install the binary
install:
	mkdir -p ../usr/local/bin
	cp $(TARGET) ../usr/local/bin/

# Clean up
clean:
	rm -f $(OBJS) $(TARGET)