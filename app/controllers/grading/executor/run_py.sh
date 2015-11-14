#!/bin/bash

cd $1
python main.py < $2 > $3 2> $4
