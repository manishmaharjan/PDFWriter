#!/bin/bash
IMAGE=pdfwriter
pwd
ls -a
echo starting to build docker images...
docker build --no-cache -t ${IMAGE} -f Dockerfile .
echo "docker images output..."
docker images
echo "output from inside container path.."
docker run --rm ${IMAGE} sh -c "ls -lahtr "
docker run --rm ${IMAGE} sh -c "pwd"
echo docker build completed..
docker run --rm ${IMAGE} sh -c "cifuzz run pdf_fuzz --use-sandbox=false > fuzzing.log 2>&1 && cat fuzzing.log"

