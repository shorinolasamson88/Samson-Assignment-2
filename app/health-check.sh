#!/bin/bash

failure=0

if [ -f ./app/diagnostic.sh ]
 then

    echo " File exists "

    if bash -n ./app/diagnostic.sh
     then

        echo " Valid Bash Syntax "

    else 
        
        echo " Invalid Bash Syntax"
        
        failure=$((failure + 1))
    fi
    

    if [ -x ./app/diagnostic.sh ]
     then
        
        echo " File is executable "

    else

        echo " File is not executable "
        failure=$((failure + 1))
    fi

else

    echo "File does not exist"
    failure=$((failure + 1))

fi

if [ "$failure" -eq 0 ]
 then
    echo " No failure detected "
    exit 0
else
    echo " Failure detected "
    exit 1
fi
