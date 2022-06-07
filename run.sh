rsync -av ../iouring edison@192.168.1.221:/mnt/dev/
ssh edison@192.168.1.221 "cd /mnt/dev/iouring; hare build -luring main.ha; ./iouring;"
