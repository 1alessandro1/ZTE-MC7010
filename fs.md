# Partition Layout & Filesystem Information

Here are the partition layout and filesystem information about all 7010 units

***MC7010-7010CA-7010(mmWave)-7010(China)***
| Dev    | Size     | Erase Size | Name          |
|--------|----------|------------|---------------|
| mtd0   | 00280000 | 00040000   | "sbl"         |
| mtd1   | 00280000 | 00040000   | "mibib"       |
| mtd2   | 00b00000 | 00040000   | "efs2"        |
| mtd3   | 00600000 | 00040000   | "efs2bak"     |
| mtd4   | 001c0000 | 00040000   | "tz"          |
| mtd5   | 00100000 | 00040000   | "tz_devcfg"   |
| mtd6   | 00180000 | 00040000   | "ddr"         |
| mtd7   | 00100000 | 00040000   | "apdp"        |
| mtd8   | 00100000 | 00040000   | "xbl_config"  |
| mtd9   | 00100000 | 00040000   | "multi_image" |
| mtd10  | 00100000 | 00040000   | "aop"         |
| mtd11  | 00100000 | 00040000   | "qhee"        |
| mtd12  | 00100000 | 00040000   | "abl"         |
| mtd13  | 00280000 | 00040000   | "uefi"        |
| mtd14  | 00180000 | 00040000   | "toolsfv"     |
| mtd15  | 00180000 | 00040000   | "loader_sti"  |
| mtd16  | 00d00000 | 00040000   | "boot"        |
| mtd17  | 00100000 | 00040000   | "scrub"       |
| mtd18  | 06640000 | 00040000   | "modem"       |
| mtd19  | 001c0000 | 00040000   | "misc"        |
| mtd20  | 00180000 | 00040000   | "devinfo"     |
| mtd21  | 00d00000 | 00040000   | "recovery"    |
| mtd22  | 001c0000 | 00040000   | "fota"        |
| mtd23  | 02b00000 | 00040000   | "recoveryfs"  |
| mtd24  | 00100000 | 00040000   | "sec"         |
| mtd25  | 08700000 | 00040000   | "zterw"       |
| mtd26  | 0a100000 | 00040000   | "system"      |

***MC7010D***
|   Dev  |   Size   | Erase Size |      Name     |
|--------|----------|------------|---------------|
| mtd0   | 00280000 | 00040000   | "sbl"         |
| mtd1   | 00280000 | 00040000   | "mibib"       |
| mtd2   | 00b00000 | 00040000   | "efs2"        |
| mtd3   | 00600000 | 00040000   | "efs2bak"     |
| mtd4   | 001c0000 | 00040000   | "tz"          |
| mtd5   | 00100000 | 00040000   | "tz_devcfg"   |
| mtd6   | 00180000 | 00040000   | "ddr"         |
| mtd7   | 00100000 | 00040000   | "apdp"        |
| mtd8   | 00100000 | 00040000   | "multi_image" |
| mtd9   | 00100000 | 00040000   | "aop"         |
| mtd10  | 00100000 | 00040000   | "qhee"        |
| mtd11  | 00100000 | 00040000   | "abl"         |
| mtd12  | 00280000 | 00040000   | "uefi"        |
| mtd13  | 00180000 | 00040000   | "toolsfv"     |
| mtd14  | 00180000 | 00040000   | "loader_sti"  |
| mtd15  | 00d00000 | 00040000   | "boot"        |
| mtd16  | 00100000 | 00040000   | "scrub"       |
| mtd17  | 06640000 | 00040000   | "modem"       |
| mtd18  | 001c0000 | 00040000   | "misc"        |
| mtd19  | 00180000 | 00040000   | "devinfo"     |
| mtd20  | 00d00000 | 00040000   | "recovery"    |
| mtd21  | 001c0000 | 00040000   | "fota"        |
| mtd22  | 02b00000 | 00040000   | "recoveryfs"  |
| mtd23: | 00100000 | 00040000   | "sec"         |
| mtd24: | 08680000 | 00040000   | "zterw"       |
| mtd25: | 000c0000 | 00040000   | "ipa_fw"      |
| mtd26: | 00100000 | 00040000   | "usb_qti"     |
| mtd27: | 0a0c0000 | 00040000   | "system"      |

Most importants partition that usally cannot be swapped in pair between firmware are: ***efs2, uefi, modem, boot and system***

- **efs2** contains all configuration (IMEI, BB settings and so on..) about baseband, so be careful to make a backup of it using Qualcomm Tool (QPST to backup as QCN file)
- **uefi** contains rexOS system that is loaded by baseband, then it will read all firmware DSP from the modem partition (AKA NON-HLOS) to inizialiate all radio stuff
- **modem** contains all DSP firmware loaded by UEFI
- **boot** is the Linux Kernel used by AP processor to load embedded drivers and start all stuff from root fs
- **system** is the Linux Root FS where all binaries are stored and ran at boot after kernel startup

**system** & **modem** partitions are created using ***UBIFS*** on top of an ***UBI*** layout. Both can be accessed (after enable SSH or TELNET on a stock unit) in read-write mode, so changes on the filesystem are possible

**system** contains 2 volumes:

| Volume Name | Description                                                                                              |
|-------------|----------------------------------------------------------------------------------------------------------|
| ***rootfs***      | Contains all Linux and ZTE executables, it can modified to add sshd\telnetd and other tools        |
| ***zte_data***    | Contains EFS default configuration (if you reset the device), web server pages, default&custom parameters used by ZTE binaries (like admin password, ip, antenna mode and so on) |

These two volumes can be extracted using [ubireader](https://github.com/onekey-sec/ubi_reader), here is a little break down on how to extract and repack them:

*Run all commands as *root* beacuse there are some special files (like /dev directory) that needs to be created*

- Install *ubireader* tool (see the link above on how to do it)
- Copy file **sdxprairie-sysfs.ubi** into a directory and the run the command `ubireader_extract_files sdxprairie-sysfs.ubi`
- This will create two folders path ubifs-root/IMAGE_ID/rootfs|ztedata
- Run again on **sdxprairie-sysfs.ubi** the command `ubireader_display_info sdxprairie-sysfs.ubi | grep Sequence` and take note of the big number after the string, should be used when we repack UBI. We will call from now *ID_GOT_FROM_UBI_DISPLAY_INFO*
- Do all your modes inside the rootfs|ztedata folder (like changing password hash, add scripts, add tools and so on)
- Re-create the two ***UBIFS*** with these commands:
    - **rootfs**: `/usr/sbin/mkfs.ubifs -m 4096 -e 253952 -c 2146 -x lzo -f 8 -k r5 -p 1 -l 4 -F -r rootfs rootfs_vol.ubifs`
    - **ztedata**: `/usr/sbin/mkfs.ubifs -m 4096 -e 253952 -c 68 -x lzo -f 8 -k r5 -p 1 -l 4 -F -r ztedata ztedata_vol.ubifs`
- Now create a file called **ubi.ini** with this content:
  
```
[rootfs]
mode = ubi
image = rootfs_vol.ubifs
vol_type = dynamic
vol_id = 0
vol_name = rootfs
vol_alignment = 1
vol_size = 141705216

[ztedata]
mode = ubi
image = ztedata_vol.ubifs
vol_type = dynamic
vol_flags = autoresize
vol_id = 1
vol_name = ztedata
vol_alignment = 1
vol_size = 8888320
```
- Finally re-create new **sdxprairie-sysfs.ubi** using the command `/usr/sbin/ubinize -p 262144 -m 4096 -O 4096 -s 4096 -x 1 -Q ID_GOT_FROM_UBI_DISPLAY_INFO -o mod_sdxprairie-sysfs.ubi ubi.ini`
- This file now can be replaced on your QFIL package and flashed back on the unit

If you want to play with ***rootfs\ztedata*** mods and avoid flash all the times with QFIL, is it possible to erase **boot** partiton, so the **abl** (Android Boot Loader) will automatically start in ***fastboot mode****, so you can boot your own kernel or flash other partition without need to put unit in ***EDL mode***, for instance to reflash system each time you can simply do:

```
fastboot erase system
fastboot flash system  mod_sdxprairie-sysfs.ubi
```

When finished, you can boot the kernel with the command: `fastboot boot sdxprairie-boot.img`
If everything is fine, just reboot unit and permanent flash the kernel with the command `fastboot flash boot sdxprairie-boot.img`
