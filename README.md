How to set up:

1. install docker:
        docker pull espressif/idf:release-v5.5 (or different release if needed)

2. set python venv:
        python3 -m venv espenv

3. install requirements (esptool should be available):
        run pip install -r requirements.txt
Activate:
        source espenv/bin/activate

4. run build (hello_world) from repo:

----------------------------------------------------> 
run docker with interactive mode: works!


docker run -it -v $PWD:/project -w /project -e HOME=/tmp -e IDF_TARGET=esp32 --device=/dev/ttyUSB0:/dev/ttyUSB0 espressif/idf:release-v5.5

cd hello_world
idf.py -p /dev/ttyUSB0 flash monitor


exit => Ctrl+]

---------------------------------------------------->

flash from host:

cd hello_world/build

esptool --chip esp32 -p /dev/ttyUSB0 -b 460800 \
--before=default_reset --after=hard_reset \
write_flash --flash_mode dio --flash_freq 40m \
--flash_size 2MB 0x1000 bootloader/bootloader.bin \
0x10000 hello_world.bin \
0x8000 partition_table/partition-table.bin


monitor:
pyserial-miniterm /dev/ttyUSB0 115200

----------------------------------------------------


----------------------------------------------------
Access to tty
ll /dev/tty* -> check for usb-serial connected
sudo chmod a+rw /dev/ttyUSB0


pip install esptool
esp_rfc2217_server -v -p 6000 /dev/ttyUSB0

docker run --rm -v .:/project  -w /project/hello_world espressif/idf:release-v5.5 idf.py --port 'rfc2217://127.0.1.1:6000?ign_set_control' flash

docker run -it -v .:/project --device=/dev/ttyUSB0:/dev/ttyUSB0 espressif/idf:release-v5.5

rfc2217://127.0.1.1:6000?ign_set_control'
----------

docker run --rm -v $PWD:/project -w /project -u $UID -e HOME=/tmp -e IDF_TARGET=esp32 --device=/dev/ttyUSB0:/dev/ttyUSB0 espressif/idf:release-v5.5  idf.py flash


sudo docker run --rm -v $PWD:/project -w /project -e HOME=/tmp -e IDF_TARGET=esp32 --device=/dev/ttyUSB0:/dev/ttyUSB0 espressif/idf:release-v5.5 idf.py flash


works!!
docker run -it -v $PWD:/project -w /project -e HOME=/tmp -e IDF_TARGET=esp32 --device=/dev/ttyUSB0:/dev/ttyUSB0 espressif/idf:release-v5.5

cd hello_world
idf.py -p /dev/ttyUSB0 flash monitor


exit => Ctrl+]


--------------------------------------
venv host create:
python3 -m venv espenv

Activate:
source espenv/bin/activate

flash
esptool.py --chip esp32 -p /dev/ttyUSB0 -b 460800 --before=default_reset --after=hard_reset write_flash --flash_mode dio --flash_freq 40m --flash_size 2MB 0x1000 >

monitor:
pyserial-miniterm /dev/ttyUSB0 115200


-----------------------



