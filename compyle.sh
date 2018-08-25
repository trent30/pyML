#!/bin/bash

python pyml.py --compile $1 | grep -Ev "^$"
