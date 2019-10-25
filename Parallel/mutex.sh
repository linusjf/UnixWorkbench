#!/usr/bin/env bash
sem 'sleep 1; echo The first finished' && \
echo The first is now running in the background && \
sem 'sleep 1; echo The second finished' && \
echo The second is now running in the background
sem --wait

sem --fg 'sleep 1; echo The first finished' && \
echo The first finished running in the foreground && \
sem --fg 'sleep 1; echo The second finished' && \
echo The second finished running in the foreground
sem --wait

sem --id my_id -u 'echo First started; sleep 10; echo First done' && \
sem --id my_id -u 'echo Second started; echo Second done' 
sem --wait
