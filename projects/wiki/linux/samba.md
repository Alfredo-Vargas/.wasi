# Samba Configurations for Linux Server and Windows Client
1. First install samba:
```console
sudo pacman -S samba
sudo vim /etc/samba/smb.conf
```
In the smb.conf file copy the default configuration from [smb config](https://git.samba.org/samba.git/?p=samba.git;a=blob_plain;f=examples/smb.conf.default;hb=HEAD)
2. Check if your configuration is in order by running:
```console
testparm
```
3. To connect a windows client to your samba share the mapping has to be:
```bash
\\IPAddress\sharename
```
- Where share name is the one between brackets `[sharename]` on the file `smb.conf`
