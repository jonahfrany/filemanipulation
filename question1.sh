#!/bin/bash
# Write a program in /app that will write 2 MB worth of file (contents can be gibberish) to /data. 
# Ensure that this will be ran every 10 minutes.

dd if=/dev/urandom of=/app/output_file.txt count=1024 bs=2024
