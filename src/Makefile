# Makefile

# Указываем путь к библиотекам
LIB_PATH = /usr/local/lib

# Указываем флаги компиляции
CXXFLAGS = -Wall -Wextra -O2 -std=c++11

# Флаги линковки
LDFLAGS = -L$(LIB_PATH) -lprometheus-cpp

# Файлы исходников
SRC = Fibi.cpp

# Цели
all: fibonacci

fibonacci: $(SRC)
    g++ $(CXXFLAGS) $(SRC) -o fibonacci $(LDFLAGS)

clean:
    rm -f fibonacci Fibi.o
