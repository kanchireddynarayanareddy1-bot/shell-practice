#!/bin/bash

Number=$1

if [ $Number -gt 100 ]; then
    echo "Number is $Number greater than 100"
elif [ $Number -eq 100 ]; then
    echo "Number is $Number equal to 100"
else
    echo "Number is less than 100"
fi