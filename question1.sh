#!/bin/bash
# Write a program in /app that will write 2 MB worth of file (contents can be gibberish) to /data. 
# Ensure that this will be ran every 10 minutes.

cp question1.sh /app
dd if=/dev/urandom of=/data/output_file.txt count=1024 bs=2024
