# This is a little guide to put an MC7010 into EDL mode on Linux/macOS (sorry guys, I hate Windows :-))

Before read the guide, you have to install on your machine [Bjoern Kerler's EDL tools](https://github.com/bkerler/edl) and sg3-utils
All commands must be run as ROOT to avoid any permission issue.

After you have all tools in your machine, connect the antenna with USB-C cable on your PC (still use PoE adapter to power it), then switch it from CDROM+RNDIS to 3 TTY MODE (Diag, Modem, NMEA) 
using this command:

`sg_raw -n /dev/sg0 99 00 00 00 00 00`

In this case I've used ***sg0*** because no other CDROM installed, just check your dmesg to see which sg is creaed when you attach the antenna to your PC
This comand will switch the antenna to DIAG mode, you should have three ***ttyUSBx*** (check again your dmesg).

Now let's switch the antenna to ***EDL mode***, this is needed to use edl tool. Use this comand to put in ***EDL/9008*** mode:

`qc_diag.py cmd 4b650100`

Check with lsusb that you have this entry:

`lsusb TBD`

# Let's play with edl tool

With antenna in ***EDL mode*** we can now issue edl commands to see, dump, erase or write partitions

Show current partitions layout:

`edl printgpt`

## Read/Erase/Write Partitions

Each time you touch a partition with EDL, it's necessary to re-write SBL (secondary boot loader) and Partition-Layout that will re-calculate all CRCs, to do this here is the command (use SBL based on your QFIL package):

Erase:
```
edl es 0 639 --memory=NAND --sectorsize=4096 
edl es 640 1279 --memory=NAND --sectorsize=4096 
```

Write Back SBL+Partition-Layout:
```
edl ws 640 partition_complete_p4K_b256K.mbn --memory=NAND --sectorsize=4096 
edl ws 0 sbl1.mbn --memory=NAND --sectorsize=4096 
```

Read single partition:

`edl r system test_system.bin --memory=NAND`

Erase single partition:

`edl e system --memory=NAND`

Write single partition:

`edl w system test_system.bin --memory=NAND`

Make whole partitions backup:

```
mkdir dump_dir
edl rl dump_dir --memory=NAND
```

Reset unit (it will boot in normal way):

`edl reset --resetmode=reset`

As discussed in the [Partition Layout & Filesystem Information](fs.md) page, it's preferred to erase just ***boot*** partition so you can use ***fastboot*** to erase\write partitions and avoid rewrite each time SBL.