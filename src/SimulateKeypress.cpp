#include "SimulateKeypress.h"

DLL_EXPORT void SimulateKeyPress(WORD key, int pressDurationMs)
{
    INPUT inputs[2] = {};

    // キーを押すイベントの設定
    inputs[0].type = INPUT_KEYBOARD;
    inputs[0].ki.wVk = key;
    inputs[0].ki.dwFlags = 0; // 押すイベント

    // キーを離すイベントの設定
    inputs[1].type = INPUT_KEYBOARD;
    inputs[1].ki.wVk = key;
    inputs[1].ki.dwFlags = KEYEVENTF_KEYUP; // 離すイベント

    // キーを押す
    SendInput(1, &inputs[0], sizeof(INPUT));

    // 指定された時間待機（ミリ秒）
    Sleep(pressDurationMs);

    // キーを離す
    SendInput(1, &inputs[1], sizeof(INPUT));
}