#!/bin/bash

echo "eneter a number: "
read Number 

if [ $(($Number%2)) -eq 0 ]; then
    echo "$Number is even number"
else
    echo "$Number is odd number"
fi