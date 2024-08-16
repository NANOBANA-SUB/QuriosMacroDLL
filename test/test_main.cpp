#include <windows.h>
#include <iostream>
#include "../src/SimulateKeypress.h"

int main() {
    // DLLのテスト
    std::cout << "Simulating 'A' key press..." << std::endl;
    SimulateKeyPress(0x41, 100); // 'A'キーを100ms押す

    return 0;
}
