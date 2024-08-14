#pragma once
#include <windows.h>
#define DLLEXPORT extern "C" __declspec(dllexport)

DLLEXPORT void SimulateKeypress(WORD key, int pressDurationMs);