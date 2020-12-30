#!/bin/sh
array=`find ../../  -name "*.tf" -type f`

for a in $array; do
    terraform fmt $a
done
