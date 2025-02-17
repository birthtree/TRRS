#include <iostream>

using namespace std;


long long fibonacchi(int n) {
    if(n <= 0) return 0;
    if(n==1) return 1;

    long long a = 0, b = 1, temp;
    for(int i = 2; i <= n; ++i) {
        temp = a + b;
        a = b;
        b = temp;
    }

    return b;

}


int main() {
    int n;
    cout << "Enter the number of Fibonacchi: ";
    while(true) {
        if(!(cin >> n)) {
            cout << "Error: enter the number! \n";
            cin.clear();
            cin.ignore(10000000, '\n');
            continue;
        }
        if(n<1 || n>= 100) {
            cout << "Error: number should be 1 - 99!\n";
            continue; 
        }

        break;
    }

    cout << "Number of Fibonacchi #" << n << " = " << fibonacchi(n) << endl;
    
    return 0;
}
