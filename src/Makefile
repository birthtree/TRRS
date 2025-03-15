TARGET = fibonacci
CC = g++
CFLAGS = -Wall -Wextra -O2 -std=c++11
LDFLAGS = -L/usr/local/lib -L/usr/local/lib64 -lprometheus-cpp -lcurl
SRCS = Fibi.cpp

all: $(TARGET) install clean

$(TARGET): $(SRCS)
	$(CC) $(CFLAGS) $(SRCS) -o $(TARGET) $(LDFLAGS)

install:
	mkdir -p ../usr/bin
	cp $(TARGET) ../usr/bin/

clean:
	rm -f $(TARGET)
