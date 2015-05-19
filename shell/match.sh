#!/bin/bash

if [[ $( echo $(hostname) | tr '[:upper:]' '[:lower:]') == *be1* ]]; then
    echo "match"
else
    echo "no match"
fi

