#!/bin/sh

while [ : ]; do
    /usr/bin/screenkey --geometry 711x900+2182-80% -s medium --opacity 0.4
    pid=$!
    sleep 10
    kill $pid
done
