#! /bin/sh
cp dwm.c dwm-orig.c
cp config.def.h config-orig.def.h

# Apply official patches
echo "Patching dwm-fibonacci"
patch -b < dwm-fibonacci-5.8.2.diff
echo "Patching dwm-push"
patch -b < dwm-push-20160731-56a31dc.diff
echo "Patching dwm-systray"
patch -b < dwm-systray-20190208-cb3f58a.diff
echo "Patching dwm-gridmode"
patch -b < dwm-gridmode-20170909-ceac8c9.diff
echo "Patching dwm-centeredmaster"
patch -b < ./dwm-centeredmaster-20160719-56a31dc.diff
echo "Patching dwm-pertag"
patch -b < dwm-pertag-20170513-ceac8c9.diff
echo "Patching dwm-titlecolor"
patch -b < dwm-titlecolor-20190206-6.2.diff
echo "Patching dwm-uselessgap"
patch -b < ./dwm-uselessgap-6.1.diff
echo "Succes"

# Create patches from my manual settings, apply
patch -b < ./my_tweaks.diff

# # Finally, apply my tweaks
cp config.def.h config.h

# # And now: build it!
# # First: Dry test run
# make clean install
sudo make clean install
