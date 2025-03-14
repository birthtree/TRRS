CXX = g++
CXXFLAGS = -std=c++11 -Wall -g
LDFLAGS = -lprometheus-cpp

SRCS = src/Fibi.cpp
OBJS = $(SRCS:.cpp=.o)
TARGET = fibonacci

# Цель по умолчанию
all: $(TARGET)

# Правило для компиляции .cpp файлов в .o
$(TARGET): $(OBJS)
	$(CXX) $(OBJS) -o $(TARGET) $(LDFLAGS)

# Правило для компиляции .cpp в .o
src/%.o: src/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Очистка сгенерированных файлов
clean:
	rm -f $(OBJS) $(TARGET)
