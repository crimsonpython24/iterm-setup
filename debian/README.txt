INSTALLATION LOG

1. Desktop icon fix
$ sudo apt install gnome-shell-extension-desktop-icons-ng

2. zram
  a. References
    https://www.techrepublic.com/article/how-to-enable-the-zram-module-for-faster-swapping-on-linux/
    https://forums.linuxmint.com/viewtopic.php?t=322567
  b. Steps
    i. In "/etc/modules-load.d/zram.conf" type zram
    ii. In "/etc/udev/rules.d/99-zram.rules" type KERNEL=="zram0", ATTR{disksize}="512M",TAG+="systemd"
    iii. In "/etc/fstab" comment out the line starting with /swap.img
    iv. In "/etc/systemd/system/zram.service" type
      [Unit]
      Description=Swap with zram
      After=multi-user.target

      [Service]
      Type=oneshot
      RemainAfterExit=true
      ExecStartPre=/sbin/mkswap /dev/zram0
      ExecStart=/sbin/swapon /dev/zram0
      ExecStop=/sbin/swapoff /dev/zram0

      [Install]
      WantedBy=multi-user.target
    v. Exit; in terminal, type 
      $ sudo systemctl enable zram
    vi. Reboot, and check with 
      $ cat /proc/swaps

3. noatime
  # File: sudo nano /etc/fstab
  add "noatime" to all ext4 partitions (comma without whitespace under the options column)

4. Install fish, cmake, and git
  > For anything that is missing, find their source repo and follow the instructions
  $ sudo apt install fish
  $ echo /usr/local/bin/fish | sudo tee -a /etc/shells
  $ chsh -s /usr/bin/fish
  Finish off with compiling alacritty/geist nerd font and installing vim

5. corectrl
  > Possibly not worth all the effort?
  a. Dependencies
    $ sudo apt-get update && sudo apt-get install build-essential 
    $ sudo apt install qtbase5-dev qt5-qmake qtbase5-dev-tools
    And then install cmake & add to fish path
  b. Qt stuffs
    $ sudo apt install libdrm-dev gcc cmake libqt4-svg libqt5svg5 qml-module-qtquick-controls qml-module-qtquick-controls2 qml-module-qtquick-controls qml-module-qtquick-layouts qml-module-qtcharts qml-module-qt-labs-platform libkf5archive5 extra-cmake-modules libqt5quickcontrols2-5 qtdeclarative5-dev libqt5charts5-dev libqt5svg5-dev qt4-linguist-tools qttools5-dev qttools5-dev-tools libkf5auth-dev libkf5archive-dev libbotan-2-dev libbotan-2-doc python3-botan qtdeclarative5-dev libqt5charts5-dev libqt5svg5-dev sysvinit-utils hwdata mesa-utils util-linux
    $ sudo apt install cmake extra-cmake-modules qttools5-dev qtdeclarative5-dev libqt5charts5-dev libqt5svg5-dev libbotan-2-dev libqca-qt5-2-dev libdrm-dev qtbase5-dev libegl1-mesa-dev libegl-dev libquazip5-dev libpolkit-gobject-1-dev libdbus-1-dev 
    $ sudo apt install qml-module-qtquick2 qml-module-qtquick-extras qml-module-qtcharts libbotan2-19 
  c. catch2
    $ git clone https://github.com/catchorg/Catch2.git
    $ cd Catch2
    $ cmake -B build -S . -DBUILD_TESTING=OFF
    $ sudo cmake --build build/ --target install
  d. trompeloeil
    $ git clone https://github.com/rollbear/trompeloeil.git
    $ cd trompeloeil 
    $ mkdir build ; cd build
    $ cmake -G "Unix Makefiles" ..
    $ sudo cmake --build . --target install
  e. Upgrade gcc (Debian repository's version is outdated)
    i. References
      https://tutorialforlinux.com/2023/07/28/gcc-13-2-debian-bookworm-installation-step-by-step/
      Newest gcc compiler: https://gcc.gnu.org/pub/gcc/releases/gcc-13.3.0/
    ii. Installation
      $ sudo apt install build-essential libncurses-dev bison flex libssl-dev libelf-dev gcc-multilib
      $ cd ~/Downloads/gcc-13.*/
      $ ./contrib/download_prerequisites
      $ ../configure --enable-languages=c,c++,fortran,objc,obj-c++,go --prefix="/usr/local"
      $ make -j $(nproc)
      $ sudo make install
    iii. change cmake compiler 
      $ export CC=/usr/local/bin/gcc
      $ export CXX=/usr/local/bin/g++
      $ cmake /path/to/your/project
      $ make
      After this, check version of gcc/g++, and use "which gcc/g++" to find their path
  f. Check glib version
    $ strings /usr/lib/x86_64-linux-gnu/libstdc++.so.6 | grep GLIBCXX
    Build needs 3.4.31 and .32
  g. (Maybe this isn't needed) sudo apt install libc6 libc6-dev libc6-dbg
  h. Install anaconda for newer GLIBCXX
    $ conda install -c conda-forge libstdcxx-ng
    Find newer files installed through Conda
    $ sudo find / -name "libstdc++.so.6"
    $ sudo cp /home/warren/anaconda3/pkgs/libstdcxx-ng-14.1.0-hc0a3c3a_0/lib/libstdc++.so.6 /usr/lib/x86_64-linux-gnu
  i. sudo make install and follow the repository's setup guide


6. Font book nerd font gnome fix
  > apt install font-manager
  (Copy the OTF file into /usr/share/fonts/opentype)
  > run sudo fc-cache -f -v
  And then change the terminal font in tweaks

7. gnupg
  Should come with debian. Follow github instructions on keygen
  Patch:
  $ git config --global user.email yjwarrenwang@protonmail.com

8. vscodium
  in ~/.config/VSCodium, create product.json, and then add
  {
    "extensionsGallery": {
      "serviceUrl": "https://marketplace.visualstudio.com/_apis/public/gallery",
      "itemUrl": "https://marketplace.visualstudio.com/items",
      "cacheUrl": "https://vscode.blob.core.windows.net/gallery/index",
      "controlUrl": ""
    }
  }