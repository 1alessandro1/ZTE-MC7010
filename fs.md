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

Most importants partition that usally cannot be swapped in pair between firmware are: efs2, uefi, modem, boot and system

- EFS2 contains all configuration (IMEI, BB settings and so on..) about baseband, so be careful to make a backup of it using Qualcomm Tool (QPST to backup as QCN file)
- UEFI contains rexOS system that is loaded by baseband, then it will read all firmware DSP from the modem partition (AKA NON-HLOS) to inizialiate all radio stuff
- MODEM contains all DSP firmware loaded by UEFI
- BOOT is the Linux Kernel used by AP processor to run all other stuff like webserver, routing, NAT and so on..
- SYSTEM is the Linux Root FS where all binaries are stored and ran at boot after kernel startup

SYSTEM & MODEM partition are created using UBIFS on top of an UBI layout. Both can be accessed (after enable SSH or TELNET on a stock unit) in read-write mode, so changes on the filesystem are possible

Funny thing: if you erase BOOT partiton, the *abl* (Android Boot Loader) will automatically start in *fastboot mode*, so you can boot your own kernel or flash other partition without need to put unit in *EDL mode*


