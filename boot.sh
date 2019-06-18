#!/bin/bash

QVER=v4.0.0
KVER=v5.0.13
RVER=2019.05

./qemu/$QVER/bin/qemu-system-riscv32  -M virt -m 1024M -smp 4 -no-reboot -nographic \
	-kernel kernel/$KVER/fw_jump.elf \
	-device loader,file=kernel/$KVER/Image,addr=0x80400000 \
	-initrd root/$RVER/rootfs.cpio.gz \
	-append 'route=172.17.0.5 root=/dev/ram0  console=ttyS0' \
	#-net nic,model=virtio -net tap -device virtio-net-device,netdev=net0,mac=60:54:d7:ae:ab:69 -netdev tap,id=net0 
