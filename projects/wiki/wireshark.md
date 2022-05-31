# Basic filtering
Some useful filters are:
* and - operator: and / &&
* or - operator: or / ||
* equals - operator: eq / ==
* not equal - operator: ne / !=
* greater than - operator: gt /  >
* less than - operator: lt / <

By IP
```console
ip.addr == <IP>
```
By source IP and destination IP
```console
ip.src == <SRC IP> and ip.dst == <DST IP>
```
By port number or Protocol Name tcp.port or udp.port, e.g:
```console
tcp.port eq <Port> or <Protocol Name>
```
To check for the IP address of given MAC address:
```console
eth.addr == 80:fb:06:f0:45:d7 && arp.dst.proto_ipv4
```
From the output of the about filter look for the entry which has an opcode = reply (2).
Remember that MAC addresses are not only level 2 identifiers and don't match with its given IP address, so to look for the packets with opcode = reply (2) it helps you with the identification.
