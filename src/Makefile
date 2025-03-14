TARGET = fibonacci
CC = g++
CFLAGS = -Wall -Wextra -O2 -std=c++11
SRCS = Fibi.cpp

# Путь к библиотекам
LIB_PATH = /usr/local/lib
LIBS = -lprometheus-cpp

# Цель по умолчанию
all: $(TARGET) install clean

# Сборка
$(TARGET): $(SRCS)
	$(CC) $(CFLAGS) $(SRCS) -o $(TARGET) -L$(LIB_PATH) $(LIBS)

# Установка
install:
	mkdir -p ../usr/bin
	cp $(TARGET) ../usr/bin/

# Очистка
clean:
	rm -f $(TARGET)
