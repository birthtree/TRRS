# Этап сборки
FROM ubuntu:latest as builder

# Устанавливаем зависимости
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    libcurl4-openssl-dev \
    zlib1g-dev

# Клонируем и собираем prometheus-cpp
RUN git clone --recursive https://github.com/jupp0r/prometheus-cpp.git && \
    cd prometheus-cpp && \
    mkdir build && cd build && \
    cmake .. -DBUILD_SHARED_LIBS=ON && \
    make -j$(nproc) && \
    make install

# Копируем и устанавливаем Debian-пакет
COPY fibonacci.deb /tmp/fibonacci.deb
RUN dpkg -i /tmp/fibonacci.deb || apt-get install -f -y

# Проверим, что бинарник в /usr/local/bin
RUN ls -l /usr/local/bin

# Финальный этап
FROM ubuntu:latest

# Устанавливаем необходимые зависимости для запуска
RUN apt-get update && apt-get install -y \
    libcurl4 \
    zlib1g

# Копируем бинарник из этапа сборки
COPY --from=builder /usr/local/bin/fibonacci /usr/local/bin/fibonacci

# Проверим, что бинарник на месте
RUN ls -l /usr/local/bin

# Даем права на выполнение
RUN chmod +x /usr/local/bin/fibonacci

# Открываем порт
EXPOSE 8080

# Запускаем программу с диагностикой
CMD echo "Starting Fibonacci program..." && /usr/local/bin/fibonacci
