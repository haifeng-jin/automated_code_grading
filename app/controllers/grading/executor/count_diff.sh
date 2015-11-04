#!/bin/bash
diff -U 0 $1 $2 | grep -v ^@ | wc -l
