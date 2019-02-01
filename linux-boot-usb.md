## How to create a bootable linux USB, using Ubuntu 18.04

1)  Download the `.iso` file from the ubuntu website at ubuntu.com. It will download into your `Downloads/` folder.

2)  Check that the SHA-256 checksum matches that of the website (it should be 5748706937539418ee5707bd538c4f5eabae485d17aa49fb13ce2c9b70532433 for my image).

    ~/Downloads $ sha256sum ubuntu-18.04.1-desktop-amd64.iso
    5748706937539418ee5707bd538c4f5eabae485d17aa49fb13ce2c9b70532433  ubuntu-18.04.1-desktop-amd64.iso


3) Put in your USB stick that you want to write the new `.iso` image to using `lsblk`. Your looking for the `/dev/sdaX` partition that matches your USB stick. Mine is mounted at `/dev/sda` Once you've found it, take out the USB and try the `lsblk` command again for a double check that you have the right reference to the USB. You should no longer see the same partition mounted if you have found the right mount point. If you'

    ~/Downloads $ lsblk
    NAME               MAJ:MIN RM   SIZE RO TYPE  MOUNTPOINT
    .....

    sda                  8:0    1  28.9G  0 disk  
    ├─sda1               8:1    1   1.8G  0 part  /media/user/
    └─sda2               8:2    1   2.3M  0 part

    .....

    4) With the USB plugged in, copy the `.iso` file from your `Downloads/` folder onto your USB stick, byte for byte.

    ~/Downloads $ sudo dd if=ubuntu-18.04.1-desktop-amd64.iso of=/dev/sda
    3815136+0 records in
    3815136+0 records out
    1953349632 bytes (2.0 GB, 1.8 GiB) copied, 165.126 s, 11.8 MB/s

Now you USB stick is ready. Go plug it into a computer, power it up and press ESC while it boots, then select the USB stick you just created to launch Ubuntu. That's it!
