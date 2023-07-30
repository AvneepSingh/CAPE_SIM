#!/bin/bash
gcc analyze.c -o analyze
./analyze in.c
python3 analyze_on_raw.py

