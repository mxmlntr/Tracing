#!/bin/bash

#Script for generating all measurements with 250kB

rm out.txt

rm -r /home/visxim/FinalTracing/250kB/DecentralizedDummy/TracingOutput

for i in {1..273}
do
    lttng-sessiond --daemonize
                                            
    lttng create DecentralizedDummySession --output=/home/visxim/FinalTracing/250kB/DecentralizedDummy/TracingOutput

    lttng enable-event --userspace tp_provider:time_tracepoint

    lttng start

    cd /home/visxim/FinalTracing/250kB/DecentralizedDummy/executables/ ; ./DecentralizedDummyProcess
    
    lttng destroy

    cd /home/visxim/FinalTracing/250kB/DecentralizedDummy/ ; babeltrace2 TracingOutput >> out.txt
    
    echo ${i}
done
