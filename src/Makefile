TARGET = fibonacci
CC = g++
CFLAGS = -Wall -Wextra -O2 -std=c++11
LIBS = -lprometheus-cpp
LIB_PATH = /usr/local/lib  # Убедитесь, что путь правильный

SRCS = Fibi.cpp

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
