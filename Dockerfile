FROM ubuntu:latest

# Установка зависимостей
RUN apt update && apt install -y \
    build-essential \
    cmake \
    git \
    zlib1g-dev \
    libcurl4-openssl-dev \
    pkg-config

# Установка Prometheus C++ Client
RUN git clone --recursive https://github.com/jupp0r/prometheus-cpp.git && \
    cd prometheus-cpp && \
    mkdir build && cd build && \
    cmake .. -DBUILD_SHARED_LIBS=ON && \
    make -j$(nproc) && \
    make install

# Копирование исходного кода
COPY src/Fibi.cpp /app/src/Fibi.cpp
COPY Makefile /app/Makefile

# Сборка приложения
WORKDIR /app
RUN make

# Открытие порта
EXPOSE 8080

# Запуск приложения
CMD ["./fibonacci"]