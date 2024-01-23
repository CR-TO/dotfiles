#!/usr/bin/env bash

# kill all running instances of polybar
killall -q polybar

echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar bar1 2>&1 | tee -a /tmp/polybar1.log & disown

echo "bars launched ..."
