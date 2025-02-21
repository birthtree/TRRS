TARGET = fibonacci
CC = g++
CFLAGS = -Wall -Wextra -O2
SRCS = Fibi.cpp

# Цель по умолчанию
all: $(TARGET) install clean

# Сборка
$(TARGET): $(SRCS)
	$(CC) $(CFLAGS) $(SRCS) -o $(TARGET)

# Установка
install:
	mkdir -p ../usr/bin
	cp $(TARGET) ../usr/bin/

# Очистка
clean:
	rm -f $(TARGET)
