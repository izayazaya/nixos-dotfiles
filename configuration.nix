{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      /etc/nixos/hardware-configuration.nix
    ];

  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 5;
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };

  # Fix time sync for dual-boot
  time.hardwareClockInLocalTime = true;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "octane"; # Define your hostname.
  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Set your time zone.
  time.timeZone = "Asia/Manila";
  
  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.izayaa = {
    isNormalUser = true;
    description = "Izayaa";
    extraGroups = [ "networkmanager" "wheel" "adbusers" "plugdev" ];
    packages = with pkgs; [];
  };

  # Change the default shell for all users.
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable steam
  programs.steam.enable = true;

  programs.adb.enable = true;

  services.udev.packages = [ pkgs.android-udev-rules ];

  # Boot with plymouth splash screen
  boot = {
    plymouth.enable = true;
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "kvm-intel.nested=1"
    ];
  };

  systemd.services."getty@tty1".enable = false;

  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;

  services.displayManager.defaultSession = "hyprland";
  programs.hyprland = {
      enable = true;
      xwayland.enable = true;
  };

  # Enable flatpak
  services.flatpak.enable = true;

  services.upower.enable = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    curl
    kitty
    waybar
    rofi
    dunst
    nwg-look
    libnotify
    librsvg
    hyprpaper
    hyprshot
    hypridle
    hyprlock
    hyprpicker
    usbutils
    udiskie
    udisks
    zsh
    bat
    btop
    cheese
    cliphist
    kdePackages.dolphin
    eza
    fastfetch
    fzf
    gimp
    github-cli
    gum
    handbrake
    htop
    krita
    less
    libreoffice-fresh
    cava
    cbonsai
    clang
    figlet
    flatpak
    jdk
    jp2a
    obs-studio
    obsidian
    prismlauncher
    qdirstat
    shotcut
    tmux
    vlc
    wlogout
    yazi
    bibata-cursors
    scrcpy
    android-tools
    lxqt.lxqt-policykit
    gsmartcontrol
    zathura
    tealdeer
    parabolic
    dosfstools
    efibootmgr
    exfatprogs
    ffmpegthumbnailer
    iio-hyprland
    imv
    linuxHeaders
    man-pages
    mpv
    os-prober
    font-awesome
    plymouth 
    rsync
    smartmontools
    unzip
    uwsm
    xdg-desktop-portal-hyprland
    xdg-user-dirs
    xdg-utils
    zoom-us
    ntfs3g
    networkmanagerapplet
    dorion
    cmatrix
    autojump
    brightnessctl
    python314
    blueman
    p7zip
  ];

  # Automatically mount drive when inserted
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  users.extraGroups.libvirtd.members = [ "izayaa" ];
  virtualisation.spiceUSBRedirection.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
