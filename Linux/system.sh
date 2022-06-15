#!/bin/bash

#free  memory on system
free -h > ~/backups/freemem/free_mem.txt

#disk usage
du -h > ~/backups/diskuse/disk_usage.txt

#open files
lsof -h > ~/backups/openlist/open_list.txt

#system disk space
df -h > ~/backups/freedisk/free_disk.txt
