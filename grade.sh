#!/bin/bash

failure=0

if [ -f README.md ]
then
    echo " PASSED: README.md file exists "

else

    echo " FAILED: README.md file does not exist "
    failure=$((failure + 1))
fi

if [ -f Dockerfile ]
then

    echo " PASSED: Dockerfile exists "
else 

    echo " FAILED: Dockerfile does not exist "
    failure=$((failure + 1))
fi

if [ -d app ]
then

    echo " PASSED: app directory exists "
else 

    echo " FAILED: app directory does not exist "
    failure=$((failure + 1))
fi

if [ -f app/diagnostic.sh ]
then

    echo " PASSED: diagnostic.sh file exists "
else 

    echo " FAILED: diagnostic.sh file does not exist "
    failure=$((failure + 1))
fi

if [ -f app/health-check.sh ]
then

    echo " PASSED: health-check.sh file exists "
else 

    echo " FAILED: health-check.sh file does not exist "
    failure=$((failure + 1))
fi

if [ -f compose.yaml ]
then

    echo " PASSED: compose.yaml file exists "
else 

    echo " FAILED: compose.yaml file does not exist "
    failure=$((failure + 1))
fi

if [ -f .dockerignore ]
then

    echo " PASSED: .dockerignore file exists "
else 

    echo " FAILED: .dockerignore file does not exist "
    failure=$((failure + 1))
fi

if [ -f test.sh ]
then 

    echo " PASSED: test.sh file exists "
else 

    echo " FAILED: test.sh file does not exist "
    failure=$((failure + 1))
fi

if [ -f grade.sh ]
then

    echo " PASSED: grade.sh file exists "
else 

    echo " FAILED: grade.sh file does not exist "
    failure=$((failure + 1))
fi
    


    if bash -n ./app/diagnostic.sh &> /dev/null
    then

        echo " PASSED: diagnostic.sh file has a valid bash syntax "
    else 
        echo " FAILED: diagnostic.sh file has an invalid bash syntax "
        failure=$((failure + 1))
    fi

    if bash -n ./app/health-check.sh &> /dev/null
    then

        echo " PASSED: health-check.sh file has a valid bash syntax "
    else 
        echo " FAILED: health-check.sh file has an invalid bash syntax "
        failure=$((failure + 1))
    fi

    if bash -n ./test.sh &> /dev/null
    then

        echo " PASSED: test.sh file has a valid bash syntax "
    else 
        echo " FAILED: test.sh file has an invalid bash syntax "
        failure=$((failure + 1))
    fi

    if bash -n ./grade.sh &> /dev/null
    then

        echo " PASSED: grade.sh file has a valid bash syntax "
    else 
        echo " FAILED: grade.sh file has an invalid bash syntax "
        failure=$((failure + 1))
    fi

    if [ -x ./app/diagnostic.sh ]
    then

        echo " PASSED: diagnostic.sh file has an executable permission "
    else 
        echo " FAILED: diagnostic.sh file does not have an executable permission "
        failure=$((failure + 1))
    fi

    if [ -x ./app/health-check.sh ]
    then

        echo " PASSED: health-check.sh file has an executable permission "
    else 
        echo " FAILED: health-check.sh file does not have an executable permission "
        failure=$((failure + 1))
    fi

    if [ -x ./test.sh ]
    then

        echo " PASSED: test.sh file has an executable permission "
    else 
        echo " FAILED: test.sh file does not have an executable permission "
        failure=$((failure + 1))
    fi

    if [ -x ./grade.sh ]
    then

        echo " PASSED: grade.sh file has an executable permission "
    else 
        echo " FAILED: grade.sh file does not have an executable permission "
        failure=$((failure + 1))
    fi

    if grep -q "FROM" Dockerfile
     then 
        echo " PASSED: Dockerfile has a FROM instruction for the base image "
    else 
        echo " FAILED: Dockerfile does not have a FROM instruction for the base image"
        failure=$((failure + 1))
    fi

    if grep -q "RUN" Dockerfile
     then
        echo " PASSED: Dockerfile has RUN instruction to install the required packages"
    else 
        echo " FAILED: Dockerfile does not have RUN instruction to install the required packages"
        failure=$((failure + 1))
    fi

    if grep -q "COPY" Dockerfile
     then
        echo " PASSED: Dockerfile has COPY instruction to copy application into the image"
    else 
        echo " FAILED: Dockerfile does not have COPY instruction to copy application into the image"
        failure=$((failure + 1))
    fi

    if grep -q "ENTRYPOINT" Dockerfile
     then
        echo " PASSED: Dockerfile has ENTRYPOINT instruction "
    else
        echo " FAILED: Dockerfile does not have ENTRYPOINT instruction "
        failure=$((failure + 1))
    fi


    if [ -s .dockerignore ]
     then
        echo " PASSED: .dockerignore file is not empty "
    else 
        echo " FAILED: .dockerignore file is empty "
        failure=$((failure + 1))
    fi

    if grep -q ".git" .dockerignore
     then
        echo " PASSED: .dockerignore file contain .git "
    else
        echo " FAILED: .dockerignore file does not contain .git "
        failure=$((failure + 1))
    fi
    

    if docker build -t diagnostic-tool . &> /dev/null
    then
        echo " PASSED: diagnostic-tool image built successfully "
    else
        echo " FAILED: diagnostic-tool image failed to build "
        failure=$((failure + 1))
    fi

    if docker run --rm diagnostic-tool system &> /dev/null
     then 
        echo " PASSED: docker run --rm diagnostic-tool system worked "
    else 
        echo " FAILED: docker run --rm diagnostic-tool system failed "
        failure=$((failure + 1))
    fi

        if docker run --rm diagnostic-tool disk &> /dev/null
     then 
        echo " PASSED: docker run --rm diagnostic-tool disk worked "
    else 
        echo " FAILED: docker run --rm diagnostic-tool disk failed "
        failure=$((failure + 1))
    fi


    if docker run --rm diagnostic-tool help &> /dev/null
     then 
        echo " PASSED: docker run --rm diagnostic-tool help worked "
    else 
        echo " FAILED: docker run --rm diagnostic-tool help failed "
        failure=$((failure + 1))
    fi


       docker run --rm diagnostic-tool invalid command &> /dev/null
       status=$?
       if [ "$status" -eq 2 ]
     then 
        echo " PASSED: docker run --rm diagnostic-tool invalid command return exit code 2  "
    else 
        echo " FAILED: docker run --rm diagnostic-tool invalid command did not return exit code 2 "
        failure=$((failure + 1))
    fi

    if docker compose config &> /dev/null
     then
        echo " PASSED: docker compose config worked "
    else 
        echo " FAILED: docker compose config failed "
        failure=$(( failure + 1 ))
    fi

    if ./test.sh &> /dev/null
     then
        echo " PASSED: test.sh worked "
    else 
        echo " FAILED: test.sh failed "
        failure=$(( failure + 1 ))
    fi

    




    
    
    if [ "$failure" -eq 0 ]
    then

        echo " All tests passed "
        exit 0
    else 
        echo " Some tests failed "
        exit 1
    fi