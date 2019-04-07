#!/bin/bash

###
for element in `seq 10`; do
    echo ${element}
done

for element in $(seq 0 2 10); do
    echo ${element}
done

for i in $(seq 1 10); do
    echo $i
done

for i in {1..10}; do
    echo ${i}
done


###
