#!/bin/bash
CITIES_FILE='cities.rb'
sort ${CITIES_FILE} > temp
mv temp ${CITIES_FILE}
git add ${CITIES_FILE}
git commit -a
gpu
rails console < ${CITIES_FILE}
