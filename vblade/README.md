# Linux : AoE VBLADE

[Simple Linux](https://users.simplenix.com/forum) vBlade Extension

The vblade is a minimal ATA over Ethernet (AoE) storage target.  Its
focus is simplicity, not performance or richness of features.  It
exports a seekable file available over an ethernet local area network
(LAN) via the AoE data storage protocol.

The name, "vblade," is historical: It is a virtual EtherDrive (R)
blade.  The first AoE target hardware sold by Coraid was in a blade
form factor, ten to a 4-rack-unit chassis.

The seekable file is typically a block device like /dev/md0 but even
regular files will work.  Sparse files can be especially convenient.
When vblade exports the block storage over AoE it becomes a storage
target.  Another host on the same LAN can access the storage if it has
a compatible aoe kernel driver.

Example: Creating a shared block device using a sparse file
  root@kokone vblade# modprobe loop
  root@kokone vblade# dd if=/dev/zero bs=1k count=1 seek=`expr 1024 \* 4096` of=bd
  root@kokone vblade# losetup /dev/loop7 bd-file  
  root@kokone vblade# ./vblade 9 0 eth0 /dev/loop7 

Example: On a client machine, utilizing this share with AoE
  root@makki ecashin# modprobe aoe
  root@makki ecashin# aoe-stat
      e9.0            eth1              up
  root@makki ecashin# mkfs -t ext3 /dev/etherd/e9.0

NOTE: Root or Super User access is going to be necessary for both

Refer to [OpenAoE](https://github.com/OpenAoE) for complete details on both extensions

