# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-fa4c98c5-f636-4f46-ba13-0c0d3ab29c44".device = "/dev/disk/by-uuid/fa4c98c5-f636-4f46-ba13-0c0d3ab29c44";
  boot.initrd.kernelModules = [ "amdgpu" ];
  # boot.kernelModules = [ "v4l2loopback" ];
  boot.extraModulePackages = with config.boot.kernelPackages; [ 
    pkgs.linuxPackages.v4l2loopback 
  ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1 card_label = "OBS Cam" exclusive_caps=1
  '';
  security.polkit.enable = true;
  networking.hostName = "mini"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.nameservers = [ "8.8.8.8" "8.8.4.4" ];  # Google DNS

  # make shebangs work
  services.envfs.enable = true;

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

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
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    wireplumber = {
      enable = true;
    };
  };
#   services.xdg.portal = {
#   enable = true;
#   extraPortals = [ pkgs.xdg-desktop-portal-wlr ]; # Replace with xdg-desktop-portal-gtk for GNOME
# };
  # systemd.user.services.xdg-desktop-portal = {
  #   enable = true;
  #   description = "XDG Desktop Portal Service";
  #   wantedBy = [ "default.target" ];
  #   serviceConfig = {
  #     ExecStart = "${pkgs.xdg-desktop-portal}/bin/xdg-desktop-portal";
  #     Restart = "always";
  #   };
  # };

  # systemd.user.services.xdg-desktop-portal-wlr = {
  #   enable = true;
  #   description = "XDG Desktop Portal WLR Service";
  #   wantedBy = [ "default.target" ];
  #   serviceConfig = {
  #     ExecStart = "${pkgs.xdg-desktop-portal-wlr}/bin/xdg-desktop-portal-wlr";
  #     Restart = "always";
  #   };
  # };



  # services.wireplumber.enable = true;
  # services.xdg.portal = {
  #   enable = true;
  #   extraPortals = [ pkgs.xdg-desktop-portal-wlr ];  # For Wayland, use the wlr portal
  # };
  # xdg.portal.config.common.default = "*";
  # xdg.portal.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.defaultUserShell = pkgs.zsh; 
  users.users.cory = {
    isNormalUser = true;
    description = "Cory";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  # clipboard.providers.wl-copy.enable = true;

  # fonts
  fonts.packages = with pkgs; [
    iosevka
    nerdfonts
  ];

  # docker
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    google-chrome
    zathura
    poppler
    wget
    git
    mako
    libnotify
    xdg-desktop-portal
    xdg-desktop-portal-wlr
    pkgs.xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    pipewire
    wireplumber
    kitty
    fuzzel
    zsh
    stow
    pkgs.antigen
    firefox
    keepassxc
    rclone
    xivlauncher
    pkgs.home-manager
    eza
    bat
    gcc
    waybar
    grim
    slurp
    wl-clipboard
    obsidian
    slack
    spotify
    discord
    qmk
    unzip
    mangohud
    protonup
    mupdf
    vlc
    jq
    bash
    bottles
    awscli2
    ssm-session-manager-plugin
    yazi
    ueberzug
    jira-cli-go
    ollama
    zoom
    cups
    hplip
    gimp
    imagemagick
    whois
    inetutils
    bind
    openvpn
    mysql-workbench
    httpie
    nodejs
    # nodePackages.nx
    wine
    winetricks
    lutris
    sambaFull
    vulkan-tools
    vulkan-loader
    docker-compose
    transmission
    signal-desktop
    glab
    pulseaudio
    (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    })
    # enable drawing tablet support
    pkgs.linuxKernel.packages.linux_6_9.digimend
  ];

  services.ollama = {
    enable = true;
    acceleration = "rocm";
  };

  # enable drawing tablet support
  services.xserver.digimend.enable = true;

  programs.hyprland.enable = true;
  programs.hyprland.xwayland.enable = true;
  programs.zsh.enable = true;

  hardware.opengl.extraPackages = with pkgs; [
    amdvlk
  ];
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      gamescopeSession.enable = true;
  };
  services.xserver.videoDrivers = ["amdgpu"];
  services.gnome.gnome-keyring.enable = true;
  programs.gamemode.enable = true;
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/cory/.steam/root/compatibilitytools.d";
  };

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
  system.stateVersion = "23.11"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.printing = {
      enable = true;
      drivers = [ pkgs.hplip ];
  };

  services.avahi = {
      enable = true;
      nssmdns = true;
      openFirewall = true;
  };

  services.blueman.enable = true;

  # hardware.pulseaudio.enable = true;
  hardware.keyboard.qmk.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
}
