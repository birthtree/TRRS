
FROM ubuntu:latest

RUN apt-get update && apt-get install -y dpkg g++ build-essential cmake git

# Устанавливаем Prometheus C++ Client
RUN git clone --recursive https://github.com/jupp0r/prometheus-cpp.git && \
    cd prometheus-cpp && \
    apt install -y zlib1g-dev \
    apt install -y libcurl4-openssl-dev \
    apt install -y libbenchmark-dev \
    mkdir build && cd build && \
    cmake .. -DBUILD_SHARED_LIBS=ON && \
    make -j$(nproc) && \
    make install

COPY fibonacci.deb /tmp/fibonacci.deb
RUN dpkg -i /tmp/fibonacci.deb || apt-get install -f
RUN chmod +x /usr/local/bin/fibonacci

EXPOSE 8080  
ENTRYPOINT ["/usr/local/bin/fibonacci"]
CMD ["5"]

