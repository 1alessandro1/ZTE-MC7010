# Steps to put CPE in EDL Mode (on Windows) and raw dump partitions

Before starting, be sure you have installed these drivers on your PC:

- [ZTE Sales Driver](Driver/DRV_DC_ZTE_AS_SETUPV1.0.0B03.exe)
- [Qualcomm 9008 USB Driver](Driver/9008 Qualcomm_USB_Driver_v1.0.zip)

## Now download all scripts and binaries to dump partitions of your unit, here is a list of needed stuff:

- [edl_tools](RAW_Dump/edl_tools) here you will have:
	- DL.exe - this executable will switch CPE from CDROM+RNDIS to 3 TTY Mode
	- ENTER_PORT_9008.cmd - this cmd will send some DIAG commands using qcommand.exe to "ZTE Diagnostic Port" and put CPE in ***EDL Mode***
	- EXIT_DIAG_PORT.cmd - this cmd will send some DIAG commands using qcommand.exe to "ZTE Diagnostic Port" and put CPE back in CDROM+RNDIS
	- qcommand.exe - it's the tool used to talk in Qualcomm DIAG language
	
If you have a MC7010 Plain/mmWave/CA Unit:

- [dump_by_parts_7010](RAW_Dump/dump_by_parts_7010) 
	- flash.exe - it's the QFIL client that issue the XML commands on Sahara 
	- loader.exe - it's the QFIL client that load the prog_filehose.mbn when CPE is in ***EDL Mode***
	- prog_filehose.mbn - loader :)
	- read_parts_7010_layout.cmd - this cmd will run loader.exe and the flash.exe to start the dump (it will reboot CPE after finished)
	- read_parts_7010_layout.xml - it's the XML file with all partitions layout information (start block, block size and so on)

If you have a MC7010D Unit:

- [dump_by_parts_7010D](RAW_Dump/dump_by_parts_7010D) 
	- flash.exe - it's the QFIL client that issue the XML commands on Sahara 
	- loader.exe - it's the QFIL client that load the prog_filehose.mbn when CPE is in ***EDL Mode***
	- prog_filehose.mbn - loader :)
	- read_parts_7010D_layout.cmd - this cmd will run loader.exe and the flash.exe to start the dump (it will reboot CPE after finished)
	- read_parts_7010D_layout.xml - it's the XML file with all partitions layout information (start block, block size and so on)

## Let's dump :-)

Before connect CPE to your PC using USB-C cable (and CPE's PoE adapter to avoid issues with boot), open Device Manager on your PC, it's useful to see when COM ports appear.
Select binary DL.exe that you have downloaded previously, attach power+usb and run repeatedly DL.exe until you will hear double sound and two COMs port should appear on Device Manager (like the image below):

IMMAGINE 

When you have those two COMs, take note of "ZTE Diagnostic Ports" COM number, run the ENTER_PORT_9008.cmd and enter the JUST the number of the COM you had taken note.
Now you will only have a single COM called "Qualcomm HS-USB 9008 blabla":

IMMAGINE

Based on your unit run read_parts_7010_layout.cmd/read_parts_7010d_layout.cmd, this will ask to enter the number of the "Qualcomm HS-USB 9008 blabla" COM, put it and follow the on-screen instruction.
It will start to dump the whole partitions (it should take less than 15 minutes), when it finished, CPE will be rebooted.

On the folder where you have downloaded all scripts and binaries you will have a folder called **dump_by_parts** with all partition's file inside

