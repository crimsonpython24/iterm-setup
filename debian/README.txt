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

7. Install fish, cmake, and git
    > For anything that is missing, find their source repo and follow the instructions
    $ sudo apt install fish
    $ echo /usr/local/bin/fish | sudo tee -a /etc/shells
    $ chsh -s /usr/bin/fish
    Finish off with adding geist nerd font and installing vim (local)
    https://github.com/alacritty/alacritty/blob/master/INSTALL.md

8. Alacritty: font book nerd font
    (Copy the OTF file into /usr/share/fonts/opentype)
    > run sudo fc-cache -f -v
    then load the toml file

9. gnupg
    Should come with debian. Follow github instructions on keygen
    Patch:
    $ git config --global user.email yjwarrenwang@protonmail.com

10. vscodium
    in ~/.config/VSCodium, create product.json, and then add
    {
        "extensionsGallery": {
            "serviceUrl": "https://marketplace.visualstudio.com/_apis/public/gallery",
            "itemUrl": "https://marketplace.visualstudio.com/items",
            "cacheUrl": "https://vscode.blob.core.windows.net/gallery/index",
            "controlUrl": ""
        }
    }

11. input settings
    $ sudo apt install fcitx5-pinyin
    $ sudo apt install --install-recommends fcitx5 fcitx5-chinese-addons kde-config-fcitx5
    fcitx5 should then be set as the default input method & the virtual keyboard
    remember to reboot
    if it still doesn't work, try to add the US keyboard layout in settings
    go thorugh the debian package wiki (the arch and the general wiki one don't help at all)

12. Extensions
    - gcolor3 for color picker
    - fail2ban (default config)
        echo -e "[sshd]\nbackend=systemd\nenabled=true" | sudo tee /etc/fail2ban/jail.local  
        $ sudo cat /etc/fail2ban/jail.local
        > [sshd]
        > backend=systemd
        > enabled = true
    - Flameshot
    (should not need auto-cpufreq because kde has its own power governor)

13. Check Desktop Env
    - echo $XDG_SESSION_TYPE

14. More minimal system tweaks:
    a. $ nano /mnt/etc/apt/apt.conf.d/01autoremove
        APT::Install-Recommends "false";
        APT::Install-Suggests "false";
        APT::AutoRemove::RecommendsImportant "false";
        APT::AutoRemove::SuggestsImportant "false";
    b. $ sudo apt-get install nohang preload
        $ sudo systemctl enable nohang
        $ sudo systemctl enable preload
        $ sed -i 's|zram_checking_enabled = False|zram_checking_enabled = True|g' /etc/nohang/nohang.conf
