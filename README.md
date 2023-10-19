# ZTE-MC7010
This is a repository with all information about Outdoor 5G CPE ZTE MC7010 family

# Hardware revision currently known
There are 5 types of HW revision avaliable on the market

- *MC7010 (w/mmWave)* --> these units are sold on various market like Italy (*from Fastweb/Linkem*). They support 5G mmWave and sub-6Ghz but LTE parts it's limited to TDD frequency. Missing HW on the board, so no way to use it with FDD
- *MC7010 (Plain Unit)* --> these units are sold on various market by Operator or directly by ZTE, common are *Elisa, Telenor, DNA, Play, TIM Italy, 3 Austria*. Firmware can be exchanged between them. No way to flash MC7010D's firmware on MC7010 plain unit, otherewise you will get  **"NO SERVICE"**
- *MC7010 (China Unit)* --> these units are sold only on China market (but you can got one from AliExpress). No knowledge if the firmware can be replaced with others. His firmware doens't work on plain MC7010 unit
- *MC7010CA* --> these units are sold on Canada market, most of them are from Telus. No mmWave support, no way to crossflash firmware
- *MC7010D* --> these units are sold on various market just by Operator, common are *Vodafone Italy, WIND Italy, Orange Poland, H3G UK, Yettel BG and so*. Firmware can be exchanged between them. No way to flash plain MC7010's firmware on MC7010D unit, otherewise you will get **"NO SERVICE"**

# Partition Layout
*MC7010-7010CA-7010 (mmWave)-7010 (China)*

| Dev    | Size     | Erase Size | Name          |
|--------|----------|------------|---------------|
| mtd0:  | 00280000 | 00040000   | "sbl"         |
| mtd1:  | 00280000 | 00040000   | "mibib"       |
| mtd2:  | 00b00000 | 00040000   | "efs2"        |
| mtd3:  | 00600000 | 00040000   | "efs2bak"     |
| mtd4:  | 001c0000 | 00040000   | "tz"          |
| mtd5:  | 00100000 | 00040000   | "tz_devcfg"   |
| mtd6:  | 00180000 | 00040000   | "ddr"         |
| mtd7:  | 00100000 | 00040000   | "apdp"        |
| mtd8:  | 00100000 | 00040000   | "xbl_config"  |
| mtd9:  | 00100000 | 00040000   | "multi_image" |
| mtd10: | 00100000 | 00040000   | "aop"         |
| mtd11: | 00100000 | 00040000   | "qhee"        |
| mtd12: | 00100000 | 00040000   | "abl"         |
| mtd13: | 00280000 | 00040000   | "uefi"        |
| mtd14: | 00180000 | 00040000   | "toolsfv"     |
| mtd15: | 00180000 | 00040000   | "loader_sti"  |
| mtd16: | 00d00000 | 00040000   | "boot"        |
| mtd17: | 00100000 | 00040000   | "scrub"       |
| mtd18: | 06640000 | 00040000   | "modem"       |
| mtd19: | 001c0000 | 00040000   | "misc"        |
| mtd20: | 00180000 | 00040000   | "devinfo"     |
| mtd21: | 00d00000 | 00040000   | "recovery"    |
| mtd22: | 001c0000 | 00040000   | "fota"        |
| mtd23: | 02b00000 | 00040000   | "recoveryfs"  |
| mtd24: | 00100000 | 00040000   | "sec"         |
| mtd25: | 08700000 | 00040000   | "zterw"       |
| mtd26: | 0a100000 | 00040000   | "system"      |

**MC7010D*

| Dev    | Size     | Erase Size | Name          |
|--------|----------|------------|---------------|
TBF

# LTE/ CA Combo
Here is a list of most common firmware's LTE/NR CA Combo:
# LTE
| Device   | Firmware           | LTE CAP                                                                               |
|----------|--------------------|---------------------------------------------------------------------------------------|
| MC7010   | Elisa B17          | https://uecapability.smartphonecombo.it/view/?id=3d81b4da-e65f-4e1c-8785-ba7d671851f1 |
| MC7010   | DNA B12            | https://uecapability.smartphonecombo.it/view/?id=3988f1ab-2aa9-4cb3-8345-549fc973f611 |
| MC7010   | H3G Austria B07    | https://uecapability.smartphonecombo.it/view/?id=6921825c-dd86-4474-867b-6cd24f3c5072 |
| MC7010   | Telenor B06        | https://uecapability.smartphonecombo.it/view/?id=e37d97a6-75fb-4722-b28e-e7c333cd11ac |
| MC7010D  | Vodafone Italy B09 | https://uecapability.smartphonecombo.it/view/?id=075420aa-369c-426f-9b66-d098421a2e67 |
| MC7010D  | WIND Italy B03     | https://uecapability.smartphonecombo.it/view/?id=0f9a07af-0a55-4a3a-81f2-4d0c65cfcb00 |
| MC7010D  | H3G UK B09         | https://uecapability.smartphonecombo.it/view/?id=3f6fd35d-971a-4b79-be24-e8db5c0e5ebe |
| MC7010CA | TELUS B01          | https://uecapability.smartphonecombo.it/view/?id=c17826c9-29da-4c81-9074-6fb078f122e9 |
# NR
| Device   | Firmware           | LTE CAP                                                                               |
|----------|--------------------|---------------------------------------------------------------------------------------|
| MC7010   | Elisa B17          | https://uecapability.smartphonecombo.it/view/?id=0ea6852b-1e16-4a60-83f5-189e3ee9b4cc |
| MC7010   | DNA B12            | https://uecapability.smartphonecombo.it/view/?id=fc321d89-459b-4638-9240-fe1e829f6d45 |
| MC7010   | H3G Austria B07    | https://uecapability.smartphonecombo.it/view/?id=9b705119-74ea-4055-b4fb-485846097e63 |
| MC7010   | Telenor B06        | https://uecapability.smartphonecombo.it/view/?id=a3fff076-92ca-4b61-8b6c-9ac43ed8901f |
| MC7010D  | Vodafone Italy B09 | https://uecapability.smartphonecombo.it/view/?id=e2ba5ea6-c543-4b6b-852f-9dd3036a1a20 |
| MC7010D  | WIND Italy B03     | https://uecapability.smartphonecombo.it/view/?id=b0983dba-8622-4a81-a2b0-bd3adee04735 |
| MC7010D  | H3G UK B09         | https://uecapability.smartphonecombo.it/view/?id=7441f517-ef84-437e-9c10-2341ff61b6fc |
| MC7010CA | TELUS B01          | https://uecapability.smartphonecombo.it/view/?id=34732bf3-ed5f-4caf-908e-75e6f8af00bd |

