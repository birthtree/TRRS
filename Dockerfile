FROM ubuntu:latest

RUN apt-get update && apt-get install -y dpkg

COPY fibonacci.deb /tmp/fibonacci.deb

RUN dpkg -i /tmp/fibonacci.deb

ENTRYPOINT ["/usr/local/bin/fibonacci"]
CMD ["5"]  # По умолчанию запускаем fibonacci 5
