#!/bin/bash
g++ -Dlinux -L./lib/linux64 ./src/modioWrapper.cpp ./src/modioWrapperCallbacks.cpp -shared -o ./bin/modioWrapperLinux_x64.ndll -I./include -lmodio -fPIC -Wl,-rpath .
haxe -cp src -main Main -cpp bin -D HXCPP_M64 -D linux 
LD_LIBRARY_PATH=./bin/ ./bin/Main
