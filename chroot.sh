IMAGE=/mnt/resource/VHD.img
losetup /dev/loop50 $IMAGE

sleep 2
mkdir /rootfs
mount /dev/loop50p2 /rootfs
sleep 1

mount -o bind /proc /rootfs/proc
mount -o bind /dev /rootfs/dev
mount -o bind /sys /rootfs/sys

mount -o bind /etc/resolv.conf /rootfs/etc/resolv.conf

chroot /rootfs

umount /rootfs/dev
umount /rootfs/sys
umount /rootfs/proc
umount /rootfs/etc/resolv.conf

umount /rootfs

losetup -d /dev/loop50
