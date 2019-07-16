# mbusd
mbusd is open-source Modbus TCP to Modbus RTU (RS-232/485) gateway for WAGO PFC200 G2 and Touch Panel 600

This is based on 3cky work for the source code, and on 004helix for docker container.
https://github.com/3cky/mbusd
https://github.com/004helix/mbusd

I've just changed the default port (502 => 1502) because 502 might already be used by default Modbus slave feature.
