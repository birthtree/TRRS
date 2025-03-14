#include <iostream>
#include <cstdlib>
#include <chrono>
#include <thread>
#include <prometheus/exposer.h>
#include <prometheus/registry.h>
#include <prometheus/counter.h>
#include <prometheus/histogram.h>

using namespace std;
using namespace prometheus;

// Функция вычисления числа Фибоначчи
long long fibonacchi(int n) {
    if (n <= 0) return 0;
    if (n == 1) return 1;
    long long a = 0, b = 1, temp;
    for (int i = 2; i <= n; ++i) {
        temp = a + b;
        a = b;
        b = temp;
    }
    return b;
}

int main(int argc, char* argv[]) {
    Exposer exposer{"0.0.0.0:8080"};  
    auto registry = std::make_shared<Registry>();

    // Создаем объект BucketBoundaries для гистограммы
    std::vector<double> buckets = {1.0, 2.0, 5.0, 10.0};  // Пример значений для границ корзин
    Histogram::BucketBoundaries bucket_boundaries(buckets);

    // Регистрируем счетчик запросов
    auto& request_counter_family = BuildCounter()
        .Name("fibonacci_requests_total")
        .Help("Total number of Fibonacci requests")
        .Register(*registry);

    // Регистрируем гистограмму запросов с границами корзин
    auto& request_time_family = BuildHistogram()
        .Name("fibonacci_request_duration_seconds")
        .Help("Histogram of request durations")
        .Buckets(bucket_boundaries)  // Указываем границы корзин
        .Register(*registry);

    // Создаем экземпляры Counter и Histogram
    auto& request_counter = request_counter_family.Add({});
    auto& request_time = request_time_family.Add({});

    exposer.RegisterCollectable(registry);

    while (true) {
        int n = rand() % 20 + 1;  // Генерируем случайное число от 1 до 20

        auto start = chrono::high_resolution_clock::now();
        long long result = fibonacchi(n);
        auto end = chrono::high_resolution_clock::now();
        
        double duration = chrono::duration<double>(end - start).count();
        request_time.Observe(duration);
        request_counter.Increment();

        cout << "Fibonacci #" << n << " = " << result << " (Time: " << duration << "s)" << endl;

        // Ждём 5 секунд перед следующим запросом
        this_thread::sleep_for(chrono::seconds(5));
    }

    return 0;
}
