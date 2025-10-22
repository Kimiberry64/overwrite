nasm mbroverwrite.asm -o mbroverwrite.bin
qemu-system-x86_64 -drive file=mbroverwrite.bin,format=raw -monitor stdio -m 256 -no-shutdown -no-reboot -accel hax -L "C:\Program Files\qemu"