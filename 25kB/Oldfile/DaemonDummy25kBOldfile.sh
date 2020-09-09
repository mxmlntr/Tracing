#!/bin/bash

#Script for generating all measurements with 25kB and Oldfile

rm out.txt

rm -r /home/visxim/FinalTracing/25kB/Oldfile/TracingOutput

for i in {1..273}
do
    lttng-sessiond --daemonize
                                            
    lttng create DaemonDummySession --output=/home/visxim/FinalTracing/25kB/Oldfile/TracingOutput

    lttng enable-event --userspace tp_provider:time_tracepoint_dummy_old
    lttng enable-event --userspace tp_provider:time_tracepoint_daemon_old

    lttng start

    cd /home/visxim/FinalTracing/25kB/Oldfile/executables/ ; ./Configuration_daemon & cd /home/visxim/FinalTracing/25kB/Oldfile/executables/ ; ./AdaptiveDummyProcess

    lttng destroy

    cd /home/visxim/FinalTracing/25kB/Oldfile/ ; babeltrace2 TracingOutput >> out.txt
    
    echo ${i}
done
