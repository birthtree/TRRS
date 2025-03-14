CXX = g++
CXXFLAGS = -std=c++11 -Wall -g
LDFLAGS = -lprometheus-cpp

SRCS = src/Fibi.cpp
OBJS = $(SRCS:.cpp=.o)
TARGET = fibonacci

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) $(OBJS) -o $(TARGET) $(LDFLAGS)

src/%.o: src/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)
