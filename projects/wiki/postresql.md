# Installing on Arch Linux
```console
sudo pacman -S postgresql
```

# Initializing the database configuration
```console
initdb --locale $LANG -E UTF8 -D '/var/lib/postgres/data'
exit
```

# Start and Enable the Postgresql service
```console
sudo systemctl start postgresql.service
sudo systemctl enable postgresql.service
```
