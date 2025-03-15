# Указываем компилятор и флаги
CXX = g++
CXXFLAGS = -Wall -g -I/usr/include/prometheus  # Указываем путь к заголовочным файлам
LDFLAGS = -L/usr/lib/x86_64-linux-gnu  # Указываем путь к библиотекам
LDLIBS = -lprometheus-cpp-core -lprometheus-cpp-pull -lprometheus-cpp-push  # Линки на библиотеки

# Цель по умолчанию
all: your_program

# Правила для сборки
your_program: main.o
	$(CXX) -o $@ $^ $(LDFLAGS) $(LDLIBS)

# Компиляция исходников
main.o: main.cpp
	$(CXX) -c $< $(CXXFLAGS)

# Удаление скомпилированных файлов
clean:
	rm -f *.o your_program
