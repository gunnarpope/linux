# How to wipe a USB stick, using Ubuntu

## Find the USB stick
In the listing below, my USB is labeled as `sda/`. Make sure this is it by unplugging it and trying again. 

	$ lsblk
	NAME               MAJ:MIN RM   SIZE RO TYPE  MOUNTPOINT
	.....
	
	sda                  8:0    1  28.9G  0 disk
	├─sda1               8:1    1   1.8G  0 part  /media/user/
	└─sda2               8:2    1   2.3M  0 part
	
	.....



## Write zeros to the device

    $ sudo dd if=/dev/zero of=/dev/sda
