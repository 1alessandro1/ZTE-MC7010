# This is a little guide to put an MC7010 into EDL mode on Linux (sorry guys, I hate Windows :-))

Before moving on, be sure that you have installed on your machine [Bjoern Kerler's EDL tools](https://github.com/bkerler/edl) and sg3-utils.

All commands must be run as ***root*** to avoid any permission issue.

Let's connect the antenna with USB-C cable on your PC (still use PoE adapter during all procedure to avoid boot issue), and switch it from *CDROM+RNDIS* to *3 TTY MODE (Diag, Modem, NMEA)* using this command:

`sg_raw -n /dev/sg0 99 00 00 00 00 00`

In this example ***sg0*** was used because no other CDROM is installed, just check your `dmesg` to see which ***sgX*** is created when you attach the antenna to your PC. After executing it, antenna will switch to DIAG mode and create three ***ttyUSBx*** ports (check again your `dmesg`).

Move on and switch the antenna to ***EDL mode***, this is needed to use **edl** tool. 
Run this command:

`qc_diag.py cmd 4b650100`

Check with lsusb that you have this entry:

`lsusb TBD`

If everything went fine, now you are in ***EDL mode*** :-)

# Let's play with edl tool

With antenna in ***EDL mode*** we can now issue edl commands to see, dump, erase or write partitions

Show current partitions layout:

`edl printgpt`

Output Example:

```
TBD
```

## Read/Erase/Write Partitions

Each time you touch a partition with EDL, it's necessary to re-write SBL (secondary boot loader) and Partition-Layout that will re-calculate all CRCs, to do this here is the command (use SBL based on your QFIL package):

Erase:
```
edl es 0 639 --memory=NAND --sectorsize=4096 
edl es 640 1279 --memory=NAND --sectorsize=4096 
```

Write Back SBL1+Partition-Layout:
```
edl ws 640 partition_complete_p4K_b256K.mbn --memory=NAND --sectorsize=4096 
edl ws 0 sbl1.mbn --memory=NAND --sectorsize=4096 
```

Read single partition:

`edl r system test_system.bin --memory=NAND`

Erase single partition:

`edl e system --memory=NAND`

Write single partition:

`edl w system system.bin --memory=NAND`

Make whole partitions backup (these files cannot be rewrite as is, needs to be refectored):

```
mkdir dump_dir
edl rl dump_dir --memory=NAND
```

Reset unit (it will boot back to normal mode):

`edl reset --resetmode=reset`

As discussed in the [Partition Layout & Filesystem Information](fs.md) page, it's preferred to erase just ***boot*** partition so you can use ***fastboot*** to erase\write partitions and avoid rewrite each time SBL1+P-Layout.
