#include <cstdlib>

char table[3 * 1024 * 1024];

extern "C" int main(int argc, char** argv) {
    volatile int temp = 0;
    while(1) {
        temp = 0;
    }
    //return atoi(argv[1]);
}
