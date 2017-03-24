#!/bin/bash

RETRY_COUNTER=0
RESULT=1
while [ "$RETRY_COUNTER" -lt 5 ] && [ "$RESULT" -ne "0" ]
do
    echo $RETRY_COUNTER
    RETRY_COUNTER=$((RETRY_COUNTER+1))
    sleep 1
    RESULT=1
done

