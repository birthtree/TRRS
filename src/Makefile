TARGET = fibonacci
CC = g++
CFLAGS = -Wall -Wextra -O2
SRCS = Fibi.cpp

# Пути к заголовочным файлам и библиотекам Prometheus
PROMETHEUS_INCLUDE = -I/usr/local/include
PROMETHEUS_LIB = -L/usr/local/lib -lprometheus-cpp -lcurl -lz

# Цель по умолчанию
all: $(TARGET) install clean

# Сборка
$(TARGET): $(SRCS)
	$(CC) $(CFLAGS) $(PROMETHEUS_INCLUDE) $(SRCS) -o $(TARGET) $(PROMETHEUS_LIB)

# Установка
install:
	mkdir -p ../usr/bin
	cp $(TARGET) ../usr/bin/

# Очистка
clean:
	rm -f $(TARGET)