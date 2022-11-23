# quenorha/mbusd

mbusd is open-source Modbus TCP to Modbus RTU (RS-232/485) gateway. It presents a network of RTU slaves as single TCP slave.
That is a TCP-Slave (or server) which acts as a RTU-master to get data from Modbus RTU-slave devices.

This container is adapted for being used on PFC200 G2 and Touch Panel 600 from WAGO.
https://www.wago.com/global/open-automation/modular-software/linux/docker

## Getting Started


### Prerequisities

In order to run this container you'll need docker installed.

Don't forget to set the embedded serial interface (X3) to Unassigned in the Web Based Management (WBM).
By default, it's already done for a PFC but not for a TP600.
A reboot is necessary.

The following script has to be called prior the start of the container. 

```shell
/etc/config-tools/set_serial_mode rs485
```

* [WAGO PFC & Touch Panel](https://github.com/WAGO/docker-ipk)

```shell
wget https://github.com/WAGO/docker-ipk/releases/download/v1.0.0/docker_18.09.0_3332.ipk
```
```shell
opkg install -V3 docker_18.09.0_3332.ipk
 ```



### Usage

#### Container Parameters

```shell
docker run -d -v /dev/serial:/dev/serial --privileged -p 1502:1502  --name=mbusd  quenorha/mbusd
```

If you want to change the default configuration (9600/8n1 and other parameters, just keep the /dev/serial device name)
More information on https://github.com/3cky/mbusd/blob/master/conf/mbusd.conf.example

```shell
docker run -d -v /dev/serial:/dev/serial --privileged -v /etc/mbusd.conf:/opt/mbusd.conf -p 1502:1502  --name=mbusd  quenorha/mbusd
```

Run it interactively 

```shell
docker run -ti -v /dev/serial:/dev/serial --privileged -p 1502:1502  --name=mbusd  quenorha/mbusd
```

#### Go further...

A better way to use it would be to create a script to start / stop the container.
This way we could call the set_serial_mode script prior starting the container. 
Open an editor to create the script
```shell
nano /etc/init.d/mbusd
```
Copy/Paste the following :
```shell
#!/bin/sh
#
#
#
case $1 in

    start)
        /etc/config-tools/set_serial_mode rs485
        docker start mbusd
        ;;

    stop)
        docker stop mbusd
        ;;
esac
```

Give it execution permission
```shell
chmod +x /etc/init.d/mbusd
```
To start the container (and call the script) at boot-up, add the following symlink :
```shell
ln -s /etc/init.d/mbusd /etc/rc.d/S99_mbusd
```
#### Useful File Locations

* `/etc/config-tools/set_serial_mode` - script on host to set the mode for serial interface X3. Can be rs232 or rs485



## Find Us

* [WAGO Github](https://github.com/WAGO)
* [WAGO Website](https://www.wago.com/fr/)

## Acknowledgments

This repo describes steps for using the nice open-source Modbus TCP to Modbus RTU gateway from Victor Antonovich aka "3cky" on the PFC.

https://github.com/3cky/mbusd

This is also based on the interesting work of "004helix" which has containerized the original application.

https://hub.docker.com/r/004helix/mbusd

* [mbusd](https://github.com/3cky/mbusd)
* [mbusd docker](https://hub.docker.com/r/004helix/mbusd)
