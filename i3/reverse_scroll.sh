#!/bin/bash

if [[ $(hostname) == "debian" ]]; then 
    xinput set-prop 11 337 1
fi 
