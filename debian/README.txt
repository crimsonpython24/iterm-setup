New installation log based on KDE

0. Pre-setup: see disk encryption and xanmod secure boot settings before proceeding 

1. Installation packages
    a. network-manager network-manager-openvpn
        tip: install, don't comment out the files immediately, install kde, then reboot and comment out
    b. kde-plasma-desktop (don't purge, it's minimal enough)
    c. ufw plasma-firewall --> ufw enable
    d. grub splash screen: /etc/default/grub add splash after quiet
    e. use power-profiles-daemon instead of tlp (better integration)
    f. intall network-manager-config-connectivity-debian for prompts

2. Clamav
    First download Clamav from the official website
    $ sudo apt install clamav clamav-daemon clamav-freshclam clamtk
    Then download the plugin (https://gitlab.com/dave_m/clamtk/-/wikis/Downloads)
    Also install the kde addon for clamtk, see docs

3. Network settings
    /etc/sysctl.conf
    net.ipv4.tcp_congestion_control = bbr
    net.ipv4.tcp_notsent_lowat = 16384
    net.core.default_qdisc = fq

    $ modprobe tcp_bbr
    $ echo "tcp_bbr" > /etc/modules-load.d/bbr.conf
    $ sudo sysctl -p
    > ...
    > ...
    > net.ipv4.tcp_congestion_control = bbr
    > net.core.default_qdisc = fq
    $ sysctl net.ipv4.tcp_congestion_control

4. Install fish, cmake, and git
    > For anything that is missing, find their source repo and follow the instructions
    $ sudo apt install fish
    $ echo /usr/local/bin/fish | sudo tee -a /etc/shells
    $ chsh -s /usr/bin/fish
    Finish off with adding geist nerd font and installing vim (local)
    https://github.com/alacritty/alacritty/blob/master/INSTALL.md

5. Alacritty: font book nerd font
    (Copy the OTF file into /usr/share/fonts/opentype)
    > run sudo fc-cache -f -v
    then load the toml file

6. gnupg
    Should come with debian. Follow github instructions on keygen
    Patch:
    $ git config --global user.email yjwarrenwang@protonmail.com

7. vscodium
    in ~/.config/VSCodium, create product.json, and then add
    {
        "extensionsGallery": {
            "serviceUrl": "https://marketplace.visualstudio.com/_apis/public/gallery",
            "itemUrl": "https://marketplace.visualstudio.com/items",
            "cacheUrl": "https://vscode.blob.core.windows.net/gallery/index",
            "controlUrl": ""
        }
    }

8. input settings
    $ sudo apt install fcitx5-pinyin
    $ sudo apt install --install-recommends fcitx5 fcitx5-chinese-addons kde-config-fcitx5
    fcitx5 should then be set as the default input method & the virtual keyboard
    remember to reboot
    if it still doesn't work, try to add the US keyboard layout in settings
    go thorugh the debian package wiki (the arch and the general wiki one don't help at all)

9. Extensions
    - gcolor3 for color picker
    - fail2ban (default config)
        echo -e "[sshd]\nbackend=systemd\nenabled=true" | sudo tee /etc/fail2ban/jail.local  
        $ sudo cat /etc/fail2ban/jail.local
        > [sshd]
        > backend=systemd
        > enabled = true
    - Flameshot
    (should not need auto-cpufreq because kde has its own power governor)

10. Check Desktop Env
    - echo $XDG_SESSION_TYPE

11. More minimal system tweaks:
    a. $ nano /mnt/etc/apt/apt.conf.d/01autoremove
        APT::Install-Recommends "false";
        APT::Install-Suggests "false";
        APT::AutoRemove::RecommendsImportant "false";
        APT::AutoRemove::SuggestsImportant "false";
    b. $ sudo apt-get install nohang preload
        $ sudo systemctl enable nohang
        $ sudo systemctl enable preload
        $ sed -i 's|zram_checking_enabled = False|zram_checking_enabled = True|g' /etc/nohang/nohang.conf

12. Installing standard notes
    Download StandardNotes-xxx.AppImage, copy to /opt/standardnotes/ folder, and rename it to StandardNotes.AppImage
    Make it executable chmod u+x StandardNotes.AppImage (also try +x if permission is denied after these steps)
    Download standardnotes-logo.svg file and copy it to /opt/standardnotes/
    $ sudo nano ~/.local/share/applications/standardnotes.desktop

    [Desktop Entry]
    Name=StandardNotes
    Exec=/opt/standardnotes/StandardNotes.AppImage %u
    Icon=/opt/standardnotes/standardnotes-logo.svg
    Comment=Draw Freely
    Type=Application
    Terminal=false
    Encoding=UTF-8
    Categories=Utility;
    StartupNotify=true
    StartupWMClass=org.standardnotes.StandardNotes

    $ update-desktop-database ~/.local/share/applications

13. Additional settings
    $ sudo apt install rkhunter
    $ sudo rkhunter --check
    $ sudo powertop --calibrate (powertop comes with kde but not calibrated)
    $ sudo systemctl enable fstrim.timer

14. Performance bug fix
    $ cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
    This may also be on perforance even if it's on battery saver
    Fix: AMD p-state EPP
    https://wiki.archlinux.org/title/Lenovo_ThinkPad_T14s_(AMD)_Gen_3#AMD_P-State_EPP

    /etc/udev/rules.d/99-battery.rules
        SUBSYSTEM=="power_supply", ATTR{online}=="0", RUN+="/usr/local/bin/on_battery.sh"
        SUBSYSTEM=="power_supply", ATTR{online}=="1", RUN+="/usr/local/bin/on_ac.sh"

    /usr/local/bin/on_battery.sh
    #!/usr/bin/bash
    
    # Change Dirty Writeback Centisecs according to TLP / Powertop
    echo '5000' > '/proc/sys/vm/dirty_writeback_centisecs';
    
    # Change AMD Paste EPP energy preference
    # Available profiles: performance, balance_performance, balance_power, power
    echo 'balance_power' | tee /sys/devices/system/cpu/cpu*/cpufreq/energy_performance_preference;
    
    # If required, change cpu scaling governor
    # Possible options are: conservative ondemand userspace powersave performance schedutil
    #cpupower frequency-set -g powersave;
    
    # Platform Profiles Daemon will do this automatically, based on your settings in KDE / GNOME
    # You can how ever, set this manually as well
    # Possible profile options are: performance, powersave, low-power
    #echo 'powersave' > '/sys/firmware/acpi/platform_profile';
    
    # Radeon AMDGPU DPM switching doesn't seem to be supported.
    # Possible options should be: battery, balanced, performance, auto
    #echo 'battery' > '/sys/class/drm/card0/device/power_dpm_state'; 
    
    # Should always be auto (TLP default = auto)
    # Possible options are: auto, high, low
    #echo 'auto' > '/sys/class/drm/card0/device/power_dpm_force_performance_level';
    
    # Runtime PM for PCI Device to auto
    find /sys/bus/pci/devices/*/power -name control -exec sh -c 'echo "auto" > "$1"' _ {} \;
    for i in $(find /sys/devices/pci0000\:00/0* -maxdepth 3 -name control); do
        echo auto > $i;
    done
    
    /usr/local/bin/on_ac.sh
    #!/usr/bin/bash
    
    # Change Dirty Writeback Centisecs according to TLP / Powertop
    echo '500' > '/proc/sys/vm/dirty_writeback_centisecs';
    
    # Change AMD Paste EPP energy preference
    # Available profiles: performance, balance_performance, balance_power, power
    echo 'balance_performance' | tee /sys/devices/system/cpu/cpu*/cpufreq/energy_performance_preference;
    
    # If required, change cpu scaling governor
    # Possible options are: conservative ondemand userspace powersave performance schedutil
    #cpupower frequency-set -g performance;
    
    # Platform Profiles Daemon will do this automatically, based on your settings in KDE / GNOME
    # You can how ever, set this manually as well
    # Possible profile options are: performance, powersave, low-power
    #echo 'performance' > '/sys/firmware/acpi/platform_profile';
    
    # Radeon AMDGPU DPM switching doesn't seem to be supported.
    # Possible options should be: battery, balanced, performance, auto
    #echo 'performance' > '/sys/class/drm/card0/device/power_dpm_state';
    
    # Should always be auto (TLP default = auto)
    # Possible options are: auto, high, low
    #echo 'auto' > '/sys/class/drm/card0/device/power_dpm_force_performance_level';
    
    # Runtime PM for PCI Device to on
    find /sys/bus/pci/devices/*/power -name control -exec sh -c 'echo "on" > "$1"' _ {} \;
    for i in $(find /sys/devices/pci0000\:00/0* -maxdepth 3 -name control); do
        echo on > $i;
    done
