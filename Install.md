# XXI Install Guide!
"I was going to make a full install script, but then I did not want to deal with UUIDs..."
- livingSatire

## Optional: Test internet
There is nothing stoping you from making a system with code on hand, however, most people will want to use XXI toolkit to fetch the code from the internet. Warning: connecting your computer to any sort of network is a securty issue. If you have connected your installer media to the internet, you can use ping to test to see if its working or not. 
`ping -c 8 1.1.1.1`

## Optional: Erase disk
You may or may not want to destory all data on the disk you are installing too. This stops any old data from being recoverable. This may be unnessary unless you are building a securty focased system. There is two options: you can zero out the disk or you may write random data on it. Wrting random data is helpfull when encripting your drive so that an attacker does not know where real system data ends and random info starts.
Option 1 - Zero out disk:
`sudo dd if=/dev/zero of=/dev/sdX bs=4k status=progress && sudo sync`
Option 2 - Overwrite with random data
`sudo dd if=/dev/random of=/dev/sdX bs=4k status=progress && sudo sync`

## Partion Disk
You will want to partion disks to install your system to. If you use BIOS, you want to make a MBR partion sceme. If you use a UEFI system, you will want to make a GPT partion sceme. Teaching you the diffrence is out of scope. I would recommend CFDisk to create the partions, and if you are using the Gentoo LiveCD, it should be preinstalled. You can use lsblk to check to make sure everything looks right.
Here are example partions:
sdX1 - 1GB (boot partion)
sdX2 - 8GB (swap partion)
sdX3 - the rest of the disk (root partion)

## Format partions
### Write fat32 filesystem to boot partion
`sudo mkfs.fat -F 32 /dev/sdaX1`

### Make swap
`sudo mkswap /dev/sdX2 && sudo swapon /dev/sdX2`

### Write EXT4 filesytem to root partion
`sudo mkfs.ext4 -V -c /dev/sdX3`

### Mount xxi partions to host
`sudo mkdir --parents /mnt/xxi && sudo mkdir /mnt/xxi/efi`
`sudo mount /dev/sdX3 /mnt/xxi`
`sudo mount /dev/sdX1 /mnt/xxi/efi`
`cd /mnt/xxi`

### Optional: Activete swap partion
`sudo swapon /dev/sdX2`

### Set permisons on install location
`sudo chown root:root /mnt/xxi`
`sudo chmod 755 /mnt/xxi`

### Make Sorce folder
`mkdir -v /mnt/xxi/sources`
