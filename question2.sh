#!/bin/bash
# Write another program in /app that will do the back up of /data on the following intervals:
# every 1 hour
# every day, delete the hourly backups
# every week, delete the daily backups
# every month, delete the weekly backups

# create directories where the backups will be stored
mkdir /opt/hourly || echo "directory hourly already exists"
mkdir /opt/daily || echo "directory daily already exists"
mkdir /opt/weekly || echo "directory weekly already exists"
mkdir /opt/monthly || echo "directory monthly already exists"

# create backup and delete scripts
echo "cd /opt/hourly && tar -czf backup$(date +"%m_%d_%Y").tar.gz /data" >> /app/hourly_backup.sh
echo "rm -rf /opt/hourly && cd /opt/daily && tar -czf backup$(date +"%m_%d_%Y").tar.gz /data" >> /app/daily_backup.sh
echo "rm -rf /opt/daily && cd /opt/weekly && tar -czf backup$(date +"%m_%d_%Y").tar.gz /data" >> /app/weekly_backup.sh
echo "rm -rf /opt/weekly && cd /opt/monthly && tar -czf backup$(date +"%m_%d_%Y").tar.gz /data" >> /app/monthly_backup.sh

# grant permission to execute
chmod +x /app/hourly_backup.sh
chmod +x /app/daily_backup.sh
chmod +x /app/weekly_backup.sh
chmod +x /app/monthly_backup.sh

# add jobs to the crontab
crontab -l > user_cron
echo "* 0 * * * ./app/hourly_backup.sh" >> user_cron
echo "59 23 * * * ./app/daily_backup.sh" >> user_cron
echo "59 23 * * 1 ./app/weekly_backup.sh" >> user_cron
echo "59 23 1 * * ./app/monthly_backup.sh" >> user_cron
crontab user_cron
rm user_cron
