#!/bin/bash

#Script for generating all measurements with 25kB 
#this script was changed for usage with ContextChange25kB
#Therefore all lttng realated code whas deleted since they are unneccessary for context changes


for i in {1..273}
do
    cd /home/visxim/FinalTracing/25kB/DecentralizedDummy/executables/ ; ./DecentralizedDummyProcess
    echo ${i}
done
