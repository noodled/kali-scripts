#!/bin/bash

# This will fix the wireless adaptor when running Kali natively on on a Macbook. Tested on Macbook Air 2012, but would work on
# similar models as well. Run:
#       lspci
# to identify your model and fix the script.

apt update -y
apt install linux-headers-$(uname -r | sed 's,[^-]*-[^-]*-,,') broadcom-sta-dkms -y
modprobe -r b44 b43 b43legacy brcmsmac
modprobe wl

# Install a power management tool (invoked later)
apt install powertop -y

# Write a script to execute at boot, fixing several issues.
cat >>/etc/rc.local <<EOL
#!/bin/bash
echo 0 > /sys/module/hid_apple/parameters/iso_layout # Fix the tilde / backtick key
powertop --auto-tune                                 # Improve power usage, fix problem of waking with lid closed
echo 1 > /proc/brcm_monitor0                         # Create a wifi interface that supports monitor mode (use prism0 for attacks)
EOL

# Call that same script on wake from sleep or hibernate
cat >> /etc/pm/sleep.d/00wake <<EOL
#!/bin/bash
case "\${1}" in
    thaw|resume)
        /etc/rc.local
        echo "It worked" >> /tmp/output
        ;;
esac
EOL

# execute rc.local
bash /etc/rc.local
