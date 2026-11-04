# This is a repository with all informations about ZTE MC7010 (Outdoor 5G CPE) family

The MC7010 CPE is a 4G/5G outdoor unit with these specs:

- Network support: SA/NSA 5G Sub-6G/mmWave + LTE Networks
- Chipset: Qualcomm 5G SDX55M platform
- CPU: Cortex A7 up to 1.4GHz
- RAM: 256MB
- NAND: 512MB
- LED: Power, Network, LAN, Signal RSSI (three leds)
- 4G LTE Cat: 20
- 5G Specs:
    - Max Speed: download up to 3.8Gbps, upload up to 331Mbps
    - Bandwidth: Sub-6G@100Mhz, mmWave@800Mhz
    - Modulation: Sub-6G DL/UL 256QAM, mmWave DL/UL 64QAM
- Dual Mode: Bridge or Router, there is no embedded Wi-Fi
- Network connectivity: 2.5GbE interface with PoE 802.3af/at (bundled injector)
- Other connectivity:
    - USB Type C with RNDIS Emulation. Can be used also for diagnostic and flash pourpose. There are user reports on forums, that this port can be also used to power the router instead of POE. 5V 3A needed (the router needs about 14.5W by POE, so I'd say _at least_ 3A power supply needed. People've also successfully powered it by powerbanks. If the power supply/powerbank uses USB PD that should not be a problem, as higher voltages demand active negotiation between devices. However, it's worth noting that any boost converters (including the ones integrated with USB cables), USB-C "power emulators" (meaning a PCB that forces power supply to work with a set particular voltage), and other devices who may force 12V (or anything higher than 5V) may destroy the router.
    - BLE: Used with *"Installer Helper App"* to point the CPE when installed outside
- Dock or Wall-Kit: based on the HW revs, you will have also a dock to install the unit inside

# Useful Stuff

- [Hardware Revision](hwrev.md)
- [Partition & Filesystem Info](fs.md)
- [LTE/NR5G CA Combos](cacombo.md)
- [Play with EDL tools and partitions](edl.md)
- [RAW DUMP with Windows](rawdump.md)

Any help is really appreciated, feel free to open a PR to fix or add informations :-)
