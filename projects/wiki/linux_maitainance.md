
# Check if any system services have failed
```console
  systemctl --failed
```

# Check the log files at
```console
cd /var/log/
```

# Check for high priority errors in the systemd journal
```console
journalctl -p 3 -b
```

# DWM Suckless window manager
To apply a patch
```console
patch -p1 < patch.diff
```

