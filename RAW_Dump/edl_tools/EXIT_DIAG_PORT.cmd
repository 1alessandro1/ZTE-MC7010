@set /p dgpnum="Diag port #: "
@qcommand -p%dgpnum% -e -c "c 4b aa 00 00 00"
@qcommand -p%dgpnum% -e -c "c 29 02 00"
@pause
@qcommand -p%dgpnum% -e -c "c 4b aa 00 00 00"
@qcommand -p%dgpnum% -e -c "c 29 02 00"
