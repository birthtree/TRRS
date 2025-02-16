CC = g++
CFLAGS = -Wall -Wextra -O2
TARGET = fibonacci

check-gpp:
	@command -v $(CC) >/dev/null 2>&1 || { echo "Error: No g++"; exit 1; }

check-deps:
	@dpkg -s build-essential >/dev/null 2>&1 || { echo "Error: No build-essential"; exit 1; } 

SRCS = Fibi.cpp

$(TARGET):check-gpp check-deps $(SRCS)
	$(CC) $(CFLAGS) $(SRCS) -o $(TARGET)
	
install:
	mkdir -p $(DESTDIR)/usr/local/bin
	cp $(TARGET) $(DESTDIR)/usr/local/bin

clean:
	rm -f $(TARGET)
