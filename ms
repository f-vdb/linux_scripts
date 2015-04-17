#!/bin/bash


sudo mount -t cifs //192.168.0.3/samba  ~/samba_mnt \
    -o user=fvdb,uid=1000
