#!/bin/bash

#Script for generating all measurements with 250kB 
#this script was changed for usage with ContextChange250kB
#Therefore all lttng realated code whas deleted since they are unneccessary for context changes


for i in {1..273}
do
    cd /home/visxim/FinalTracing/250kB/DecentralizedDummy/executables/ ; ./DecentralizedDummyProcess
    echo ${i}
done
