#!/bin/bash

#project_name="${PWD##*/}"
project_name='enfermedad-cardiaca'
volume=$PWD

if [[ "$(diff ./requirements.txt ./.requirements.txt)" != "" ]]; then

  if [ -f "$PWD/GITIGNORE" ]; then
    mv GITIGNORE .gitignore
  fi

  echo "...Installing new packages.."
  docker build -t $project_name .
  cp requirements.txt .requirements.txt 
fi


docker run --rm --name=$project_name \
  -v $volume:/workdir \
  -w /workdir \
  -p 8888:8888 \
  -e JUPYTER_ENABLE_LAB=yes \
  $project_name
  
