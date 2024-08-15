#include <windows.h>
#include <iostream>
#include "../src/SimulateKeypress.h"  // 関数の宣言をインクルード

int main() {
    // メモ帳を探してフォーカスを与える（既にメモ帳が開いている必要がある）
    /*
    HWND hwnd = FindWindow(NULL, L"無題 - メモ帳");
    if (hwnd == NULL) {
        std::cerr << "メモ帳が見つかりません。" << std::endl;
        return -1;
    }
    SetForegroundWindow(hwnd);
    Sleep(500);  // フォーカスが確実に移るように少し遅延
    */

    // DLLの関数を直接呼び出す
    std::cout << "Simulating 'A' key press..." << std::endl;
    SimulateKeyPress(0x41, 100); // 'A'キーを100ms押す

    return 0;
}
