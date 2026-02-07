#!/bin/bash

display_menu() {
    echo "======================================"
    echo "  Pilih Versi Windows untuk QEMU"
    echo "======================================"
    echo "1.  Windows Server 2016"
    echo "2.  Windows Server 2019"
    echo "3.  Windows Server 2022"
    echo "4.  Windows Server 2025"
    echo "5.  Windows 10"
    echo "6.  Windows 11"
    echo "7.  Windows Ghost Spectre 10"
    echo "8.  Windows Ghost Spectre 11"
    echo "9.  Windows Atlas OS 10"
    echo "10. Windows Atlas OS 11"
    echo "======================================"
    read -p "Masukkan pilihan (1-10): " choice
}

# Update system
apt-get update && apt-get upgrade -y

# Install QEMU
apt-get install qemu -y
apt install qemu-utils -y
apt install qemu-system-x86-xen -y
apt install qemu-system-x86 -y
apt install qemu-kvm -y

echo "QEMU berhasil diinstall."

display_menu

case $choice in
    1)
        img_file="winserver2016.img"
        iso_file="winserver2016.iso"
        iso_link="https://go.microsoft.com/fwlink/p/?LinkID=2195174&clcid=0x409&culture=en-us&country=US"
        ;;
    2)
        img_file="winserver2019.img"
        iso_file="winserver2019.iso"
        iso_link="https://go.microsoft.com/fwlink/p/?LinkID=2195167&clcid=0x409&culture=en-us&country=US"
        ;;
    3)
        img_file="winserver2022.img"
        iso_file="winserver2022.iso"
        iso_link="https://go.microsoft.com/fwlink/?linkid=2195280&clcid=0x409&culture=en-us&country=US"
        ;;
    4)
        img_file="winserver2025.img"
        iso_file="winserver2025.iso"
        iso_link="https://go.microsoft.com/fwlink/?linkid=2345730&clcid=0x409&culture=en-us&country=us" # ganti link official
        ;;
    5)
        img_file="windows10.img"
        iso_file="windows10.iso"
        iso_link="http://152.53.194.161/WIN10.ISO"
        ;;
    6)
        img_file="windows11.img"
        iso_file="windows11.iso"
        iso_link="http://152.53.194.161/WIN11.ISO"
        ;;
    7)
        img_file="ghostspectre10.img"
        iso_file="ghostspectre10.iso"
        iso_link="PUT_GHOST_SPECTRE_10_ISO_LINK_HERE"
        ;;
    8)
        img_file="ghostspectre11.img"
        iso_file="ghostspectre11.iso"
        iso_link="PUT_GHOST_SPECTRE_11_ISO_LINK_HERE"
        ;;
    9)
        img_file="atlas10.img"
        iso_file="atlas10.iso"
        iso_link="PUT_ATLAS_OS_10_ISO_LINK_HERE"
        ;;
    10)
        img_file="atlas11.img"
        iso_file="atlas11.iso"
        iso_link="PUT_ATLAS_OS_11_ISO_LINK_HERE"
        ;;
    *)
        echo "Pilihan tidak valid!"
        exit 1
        ;;
esac

echo "Versi dipilih: $iso_file"

# Create disk image
qemu-img create -f raw "$img_file" 40G

# Download VirtIO
wget -O virtio-win.iso \
https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/stable/virtio-win.iso

# Download Windows ISO
wget -O "$iso_file" "$iso_link"

echo "======================================"
echo "Setup selesai!"
echo "Disk : $img_file"
echo "ISO  : $iso_file"
echo "======================================"
