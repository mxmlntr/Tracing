#!/bin/bash

#Script for generating all measurements with 25kB and oldfile
#this script was changed for usage with ContextChange25kB_Oldfile
#Therefore all lttng realated code whas deleted since they are unneccessary for context changes


for i in {1..273}
do
    cd /home/visxim/FinalTracing/25kB/Oldfile/executables/ ; ./Configuration_daemon & cd /home/visxim/FinalTracing/25kB/Oldfile/executables/ ; ./AdaptiveDummyProcess
    echo ${i}
done