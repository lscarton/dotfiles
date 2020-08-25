# Commands to perform misc actions without GUI

## Format a usb stick

Erase all data (source: https://askubuntu.com/a/204597/873993)
- Find usb
  ```
  lsblk
  ```

- Unmount the usb if mounted
  ```
  sudo umount /dev/sdxx
  ```

- Format the usb
  ```
  sudo mkfs.vfat /dev/sdxx
  ```
  or
  ```
  sudo mkfs.vfat -n "usb name" /dev/sdxx
  ```
  or if usb has partitions and all partitions need to be formatted then
  ```
  sudo mkfs.vfat -n "usb name" -I /dev/sdx
  ```

Make new partition on the newly formatted usb (source: https://askubuntu.com/a/571340/873993)
- Make new partition table
  ```
  sudo fdisk /dev/sdx
  ```
  Press `o` to create new DOS partition table

- Make a new partition
  Press letter `n` to add a new partition.
  You will be prompted for the size of the partition.
  Making a primary partition when prompted, if you are not sure. Use default if not sure.
  Then press letter `w` to write table to disk and exit.

- Format the newly created partition to make it easily mountable.
