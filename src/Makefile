CC = g++
CFLAGS = -Wall -Wextra -O2 -std=c++11
LDFLAGS = -lprometheus-cpp

SRCS = Fibi.cpp
OBJS = Fibi.o
TARGET = fibonacci

# Цель по умолчанию
all: $(TARGET) install clean

# Сборка
$(TARGET): $(OBJS)
	$(CC) $(OBJS) -o $(TARGET) $(LDFLAGS)

# Компиляция исходников в объектные файлы
$(OBJS): $(SRCS)
	$(CC) $(CFLAGS) -c $(SRCS)

# Установка
install:
	mkdir -p ../usr/local/bin
	cp $(TARGET) ../usr/local/bin/

# Очистка
clean:
	rm -f $(OBJS) $(TARGET)
