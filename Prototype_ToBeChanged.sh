#!/bin/bash

#NAME OF THE SCRIPT

rm out.txt

rm -r /home/visxim/Tracing/UserSpaceTracing/DaemonDummy/NoOpt_25kB/Newfile/TracingOutput

for i in {1..20}
do
    lttng-sessiond --daemonize
                                            
    lttng create DaemonDummySession --output=/home/visxim/Tracing/UserSpaceTracing/DaemonDummy/NoOpt_25kB/Newfile/TracingOutput/

    lttng enable-event --userspace tp_provider:time_tracepoint_dummy_new
    lttng enable-event --userspace tp_provider:time_tracepoint_daemon_new

    lttng start

    cd /home/visxim/Tracing/UserSpaceTracing/DaemonDummy/NoOpt_25kB/Newfile/executables/ ; ./Configuration_daemon & cd /home/visxim/Tracing/UserSpaceTracing/DaemonDummy/NoOpt_25kB/Newfile/executables/ ; ./AdaptiveDummyProcess

    lttng destroy

    cd /home/visxim/Tracing/UserSpaceTracing/DaemonDummy/NoOpt_25kB/Newfile/ ; babeltrace2 TracingOutput >> out.txt
    
    echo ${i}
done
