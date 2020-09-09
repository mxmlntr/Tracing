#!/bin/bash

#Script for generating all measurements with 2.5kB and newfile

rm out.txt

rm -r /home/visxim/FinalTracing/2.5kB/Newfile/TracingOutput

for i in {1..273}
do
    lttng-sessiond --daemonize
                                            
    lttng create DaemonDummySession --output=/home/visxim/FinalTracing/2.5kB/Newfile/TracingOutput

    lttng enable-event --userspace tp_provider:time_tracepoint_dummy_new
    lttng enable-event --userspace tp_provider:time_tracepoint_daemon_new

    lttng start

    cd /home/visxim/FinalTracing/2.5kB/Newfile/executables/ ; ./Configuration_daemon & cd /home/visxim/FinalTracing/2.5kB/Newfile/executables/ ; ./AdaptiveDummyProcess

    lttng destroy

    cd /home/visxim/FinalTracing/2.5kB/Newfile/ ; babeltrace2 TracingOutput >> out.txt
    
    echo ${i}
done
