#!/bin/bash
# Write a program in /app that will write 2 MB worth of file (contents can be gibberish) to /data. 
# Ensure that this will be ran every 10 minutes.

echo "export now=$(date +"%m_%d_%Y")" >> /app/create_file.sh
echo "dd if=/dev/urandom of=/data/output_file_$now.txt count=1024 bs=2024" >> /app/create_file.sh
crontab -l > user_cron
echo "10 * * * * ./app/create_file.sh" >> user_cron
crontab user_cron
rm user_cron
