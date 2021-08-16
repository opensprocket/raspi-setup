# Post-script config

## Secondary Admin Creation

Create account (enter password when prompted):
```
sudo adduser doterrala
```
Update Group membership (one line):
```
sudo usermod -G adm,dialout,cdrom,sudo,audio,video,plugdev,games,input,netdev,lpadmin,gpio,i2c,spi doterrala
```

## Update `pi` User

Set password for `pi`:
```
sudo passwd pi
```

Remove `pi` from sudo group
```
sudo gpasswd -d pi sudo
```

Remove `pi` sudoers file:
```
sudo rm /etc/sudoers.d/010_pi-nopasswd
```

