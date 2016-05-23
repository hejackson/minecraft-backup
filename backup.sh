#!/bin/bash

logger -t "MINECRAFT" "Backup started at $(date)"

location=/home/edjacks/files/minecraft

cd ${location}/backups

# remove oldest
touch 5
rm -Rf ./5


# cycle through moving 4->5, 3->4, 2->3, 1->2
for i in 4 3 2 1; do
	mv ${i} $((i + 1))
done

# backup current
rm -Rf ./1
mkdir 1
cp -av ${location}/server ./1/
echo "backed up at $(date)" > ./1/backup-info.txt

logger -t "MINECRAFT" "Backup completed at $(date)"
