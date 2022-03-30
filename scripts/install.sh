# Import file generated by the installer
. /usr/local/potabi/config.conf 

# Destroy zpool if exists
zpool destroy -f install-potabi | true

# Mount release
mkdir -pv /mnt/install
zpool create install-potabi /dev/${disk}
zfs set mountpoint=/mnt/install install-potabi
zfs set compression=gzip-6 install-potabi

# Unpack base and kernel into directory

# Unmount at end of script
zfs unmount -f /mnt/install
zpool destroy -f install-potabi