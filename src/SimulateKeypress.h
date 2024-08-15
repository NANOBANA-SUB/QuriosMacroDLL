#ifndef SIMULATE_KEYPRESS_H
#define SIMULATE_KEYPRESS_H

#include <windows.h>

#ifdef BUILD_DLL
#define DLL_EXPORT __declspec(dllexport)
#else
#define DLL_EXPORT __declspec(dllimport)
#endif

extern "C" DLL_EXPORT void SimulateKeyPress(WORD key, int pressDurationMs);

#endif // SIMULATE_KEYPRESS_H
