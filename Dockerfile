FROM ubuntu:latest

# Установка зависимостей
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

# Копируем исходный код программы
COPY src /src
WORKDIR /src

# Собираем программу
RUN make

# Запуск программы
CMD ["./fibonacci"]