INSTALLATION LOG

1. Clamav
  First download Clamav from the official website
  $ sudo apt install clamav clamav-daemon clamav-freshclam clamtk
  Then download the plugin (https://gitlab.com/dave_m/clamtk/-/wikis/Downloads)

2. ufw (firewall)
  $ sudo install ufw
  $ ufw enable
  Optional (likely breaks things):
  $ ufw default deny incoming
  $ ufw default allow outgoing

3. Xanmod
  Follow things on https://xanmod.org/
  If AMD GPU firmwares are lacking, go to https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/log/

4. Theme: https://github.com/vinceliuice/Fluent-gtk-theme
  > reboot after these steps

5. zram
  a. References
    https://www.techrepublic.com/article/how-to-enable-the-zram-module-for-faster-swapping-on-linux/
    https://forums.linuxmint.com/viewtopic.php?t=322567
    https://github.com/M-Gonzalo/zramd
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
      $ sudo systemctl mask  "dev-nvme0n1p6.swap"
      $ cat /proc/swaps

6. noatime
  # File: sudo nano /etc/fstab
  add "noatime" to all ext4 partitions (comma without whitespace under the options column)
  Also change bufferfloat settings /etc/sysctl.conf
    net.ipv4.tcp_congestion_control = bbr
    net.ipv4.tcp_notsent_lowat = 16384
    net.core.default_qdisc = fq_codel
> Reboot system after these steps

7. Install fish, cmake, and git
  > For anything that is missing, find their source repo and follow the instructions
  $ sudo apt install fish
  $ echo /usr/local/bin/fish | sudo tee -a /etc/shells
  $ chsh -s /usr/bin/fish
  Finish off with compiling alacritty/geist nerd font and installing vim
  https://github.com/alacritty/alacritty/blob/master/INSTALL.md

8. corectrl
  > Possibly not worth all the effort?
  a. Dependencies
    $ sudo apt-get update && sudo apt-get install build-essential
    $ sudo apt install qtbase5-dev qt5-qmake qtbase5-dev-tools
    And then install cmake & add to fish path
  b. Qt stuffs
    $ sudo apt install cmake extra-cmake-modules qttools5-dev qtdeclarative5-dev libqt5charts5-dev libqt5svg5-dev libbotan-2-dev libqca-qt5-2-dev libdrm-dev qtbase5-dev libegl1-mesa-dev libegl-dev libquazip5-dev libpolkit-gobject-1-dev libdbus-1-dev
    $ sudo apt install qml-module-qtquick2 qml-module-qtquick-extras qml-module-qtcharts libbotan2-19 
    $ sudo apt install libquazip1-qt5-dev libspdlog-dev libpugixml-dev qml-module-qtquick-controls2 qml-module-qt-labs-platform
    Note: these libraries are NOT dependent with Gnome 42+ (only works on Debian; if on other distros, maybe use repository)
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
    $ strings /usr/lib/x86_64-linux-gnu/libstdc++.so.6 | grep GLIBCXX_3.4.3
    Build needs 3.4.31 and .32
  g. (Maybe this isn't needed) sudo apt install libc6 libc6-dev libc6-dbg
  h. Install anaconda for newer GLIBCXX
    (note: must run export before creating the build directory)
    $ conda install -c conda-forge libstdcxx-ng libgcc
    Find newer files installed through Conda
    $ sudo find / -name "libstdc++.so.6"
    $ sudo cp /home/warren/anaconda3/pkgs/libstdcxx-ng-14.1.0-hc0a3c3a_0/lib/libstdc++.so.6 /usr/lib/x86_64-linux-gnu
  i. sudo make install and follow the repository's setup guide

9. Font book nerd font gnome fix
  (Copy the OTF file into /usr/share/fonts/opentype)
  > run sudo fc-cache -f -v
  And then change the terminal font in tweaks

10. gnupg
  Should come with debian. Follow github instructions on keygen
  Patch:
  $ git config --global user.email yjwarrenwang@protonmail.com

11. vscodium
  in ~/.config/VSCodium, create product.json, and then add
  {
    "extensionsGallery": {
      "serviceUrl": "https://marketplace.visualstudio.com/_apis/public/gallery",
      "itemUrl": "https://marketplace.visualstudio.com/items",
      "cacheUrl": "https://vscode.blob.core.windows.net/gallery/index",
      "controlUrl": ""
    }
  }

12. Passmark/Geekbench/etc.
  Deps:
  $ sudo apt-get install libncurses5 libncurses5-dev ia32-libs

13. Pinyin
  Go into '/etc/locale.gen' and uncomment simplified/traditional Chinese locales
  $ sudo apt-get install ibus-pinyin
  $ sudo apt-get install ibus-sunpinyin
  $ ibus restart
  > reboot after these steps

14. Extensions
  - Just Perfection (need corresponding Chrome ext.)
  - Impatience (gfxmonk)
  - Use Dolphin (KDE) as file manager
    $ find /usr/share/applications/ -iname "*dolphin*"
    $ xdg-mime default org.gnome.(name).desktop inode/directory
    $ xdg-mime query default inode/directory
    & uninstall the default files app in the app store
    (after uninstalling, reboot to let Gnome register Dolphin as default file manager, and then re-install for (15))
  - nala over apt (just apt update, install, and update again)
  - Dash-to-panel, AppIndicator KStatus, OpenWeather
  - gcolor3 for color picker

15. Check Desktop Env
  $ echo $XDG_SESSION_TYPE

16. Change swappiness to 0
  /etc/sysctl.conf --> vm.swappiness=0
  $ cat /proc/sys/vm/swappiness

17. Debloat
  sudo apt purge iagno lightsoff four-in-a-row gnome-robots pegsolitaire gnome-2048 hitori gnome-klotski gnome-mines gnome-mahjongg gnome-sudoku quadrapassel swell-foop gnome-tetravex gnome-taquin aisleriot gnome-chess five-or-more gnome-nibbles tali ; sudo apt autoremove

18. Show desktop icons
  Gtk4 Desktop Icons NG (DING) by smedius
  Depends on nautilus (https://packages.debian.org/sid/all/nautilus-data/download)

19. Input performance
  $ sudo apt install xserver-xorg-input-synaptics
  $ sudo apt upgrade libinput-bin

20. Auto-cpufreq (not used currently since Lenovo has a built-in firmware)

21. More extensions:
  a. clipboard-indicator (c-F9 for menu, disable tray icon)
  b. fail2ban (default config)
  c. Grand Theft Focus
  d. Flameshot
    https://flameshot.org/docs/guide/key-bindings/ (set as alt+shift+s)
  e. Portmaster
    To start the initial service:
    $ mkdir -p /opt/safing/portmaster

    $ wget -O /tmp/portmaster-start https://updates.safing.io/latest/linux_amd64/start/portmaster-start
    $ sudo mv /tmp/portmaster-start /opt/safing/portmaster/portmaster-start
    $ sudo chmod a+x /opt/safing/portmaster/portmaster-start

    $ sudo /opt/safing/portmaster/portmaster-start --data /opt/safing/portmaster update
    
    
-------------------- ARCHIVED --------------------
22. Bluetooth quick connect (UPDATE may not be compatible, abort if Gnome cannot be updated, will break Qt otherwise):
  a. Side quest: update Gnome to unstable version (v.46)
    Reference: https://raspberrytips.com/latest-gnome-installation-debian/
    $ nano /etc/apt/sources.list
      deb http://deb.debian.org/debian/ unstable main contrib
      deb-src http://deb.debian.org/debian/ unstable main contrib
    $ nano /etc/apt/preferences
      Package: *
        Pin: release a=bookworm
        Pin-Priority: 500

        Package: *
        Pin: release a=unstable
        Pin-Priority: 100
    $ apt update
    $ apt search gnome-session-bin
    $ apt -t unstable search gnome-session-bin
    $ apt -t unstable install gnome-session gnome-shell gnome-backgrounds gnome-applets gnome-control-center mutter gjs
  b. Install the unstable repository
    $ apt -t unstable install gnome-tweaks
    (then install bluetooth-quick-connect and reboot)
