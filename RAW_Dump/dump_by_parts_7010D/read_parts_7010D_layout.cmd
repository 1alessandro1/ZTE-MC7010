@set /p X="9008 Port #: "
@loader -p \\.\COM%X% -s 13:prog_firehose.mbn

mkdir dump_by_parts

@pause

@flash.exe --port=\\.\COM%X% --convertprogram2read --sendxml=read_parts_7010D_layout.xml --reset --noprompt --showpercentagecomplete --zlpawarehost=1 --memoryname=nand