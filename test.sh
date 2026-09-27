#!/bin/bash

failure=0

if docker run --rm diagnostic-tool system &> /dev/null
 then
    echo " System check successful "

    
 else
    echo " System check failed "
    failure=$((failure + 1))
 fi

if docker run --rm diagnostic-tool disk &> /dev/null
  then
    echo " Disk check successful "

    
 else
    echo " Disk check failed "
    failure=$((failure + 1))
 fi





if docker run --rm diagnostic-tool help &> /dev/null 
 then
    echo " Help check successful "

    
 else
    echo " Help check failed "
    failure=$((failure + 1))
 fi

 
  docker run --rm diagnostic-tool invalid &> /dev/null
status=$?
    
    if [ "$status" -eq 2 ]
    then
      
        echo " Invalid command check successful "

    else

    echo " Invalid command check failed "
    failure=$((failure + 1))

    fi
  









if [ "$failure" -eq 0 ]
  then
    echo " All checks passed "
    exit 0
 else
    echo " Some checks failed "
    exit 1
 fi 