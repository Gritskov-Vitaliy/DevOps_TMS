#!/bin/bash

containers_exited137=$(docker ps -af 'exited=137' | wc -l)
quantity_images=$(("$(docker images | wc -l)"-1))
quantity_containers_run=$(("$(docker ps | wc -l)"-1))
quantity_containers_exited=$(("$(docker ps -af 'exited=0' | wc -l)"+"$(docker ps -af 'exited=137' | wc -l)"-2))


echo "          IMAGES (Quantity: $quantity_images)"
docker images 
echo
echo "          Containers run (Quantity: $quantity_containers_run)"
docker ps -s
echo
echo "          Containers exited (Quantity: $quantity_containers_exited)"
docker ps -asf 'exited=0'
docker ps -af 'exited=137' | tail -n 1
