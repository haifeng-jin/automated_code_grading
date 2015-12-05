#!/bin/bash

cd $1
java -Xmx256m Main < $2 > $3 2> $4
