* sipeed toolchain

some config file for sipeed board

* support

| board name   | linux    | boot | lcd | camera | eth | wifi | npu          | hw accel     | usb |
|--------------+----------+------+-----+--------+-----+------+--------------+--------------+-----|
| licheervnano | bsp 5.10 | bsp  | OK  | WIP    | OK  | OK   | no full test | no full test | OK  |
| licheepi4a   | bsp 5.10 | bsp  |     |        |     |      |              |              |     |

* usage

#+BEGIN_SRC shell
git clone https://github.com/buildroot/buildroot
git checkout v20xx.xx
for i in /path/to/sipeed-toolchain/buildroot-sipeed/patches/*.patch
do
	patch -p1 < $i
done
export BR2_EXTERNAL=/path/to/sipeed-toolchain/buildroot-sipeed/
make xxxx_defconfig # eg: licheervnano_defconfig
make -j`nproc`
ls output/images/xxx.img
#+END_SRC

* more

https://buildroot.org/downloads/manual/manual.html


