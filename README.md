# This is a repository with all informations about ZTE MC7010 (Outdoor 5G CPE) family

# HW revisions (currently known)
There are five different hardware revisions available on the market; some others may also be available, but I've never seen them on my own :)

- *MC7010 (***w/mmWave***)* --> these units are sold in various markets (like Italy, by *Fastweb/Linkem*). They support 5G mmWave and sub-6GHz, but they only support TDD LTE bands. They actually miss HW on the board, so there is no way to use them with FDD bands.
- *MC7010 (***Plain Unit w/o mmWave***)* --> these units are sold in various markets by ISPs or directly by **ZTE**. The most commonly found are from ***Elisa, Telenor, DNA, Play, TIM Italy, 3 Austria***. Their firmware can be exchanged between them. Flashing firmware from **MC7010Ds** on plain **MC7010s** units is not possible, otherwise you will get **"NO SERVICE"**.
- *MC7010 (***China Unit***)* --> these units are sold only in the Chinese market (but they're easily found on AliExpress). It is not currently known whether the firmware can be replaced with the firmware from other versions. Their firmware doens't work on plain **MC7010** units.
- *MC7010CA* --> these units are sold in the Mexican or Canadian markets. The most commonly found are from ***Telus, Roger and Telcel***. No mmWave support, crossflashing firmware is not possible.
- *MC7010D* --> these units are sold in various markets, only by ISPs. The most commonly found are from ***Vodafone Italy, WINDTRE Italy, Orange Poland, H3G UK, Yettel BG***. Their firmware can be exchanged between them. Flashing the firmware from plain **MC7010s** on **MC7010D** units is not possible, otherwise you will get **"NO SERVICE"**.

All other variants can be found on the **ZTE ECCN** site at [this link](https://www.zte.com.cn/global/about/eccn.html)

Here is some useful stuff:

- [Partition & Filesystem Info](fs.md)
- [LTE/NR5G CA Combos](cacombo.md)
- [Play with EDL tools and partitions](edl.md)

Any help is really appreciated, feel free to open a PR to fix or add informations :-)
