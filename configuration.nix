# vim: ts=2 sw=2
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let unstableTarball = fetchTarball https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz; in

{
  imports = [ ./hardware-configuration.nix ];

	nixpkgs.config.allowUnfree = true;
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  # boot.loader.grub.device = "/dev/nvme0n1p4";
  # boot.loader.grub.useOSProber = true;

  networking.hostName = "dedxacah-nix"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Minsk";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

	services.xserver.enable = true;
	services.displayManager.sddm.enable = true;
	services.displayManager.sddm.wayland.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dedxacah = {
    isNormalUser = true;
    description = "dedxacah";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

	users.defaultUserShell = pkgs.zsh;

	nixpkgs.config = {
		packageOverrides = pkgs: {
			unstable = import unstableTarball {
				config = config.nixpkgs.config;
			};
		};
	};

	programs.steam = {
		enable = true;
		remotePlay.openFirewall = true;
		dedicatedServer.openFirewall = true;
	};

	programs.hyprland.enable = true;
	programs.zsh.enable = true;

	services.flatpak.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
		# TODO SORT
		wget
		sof-firmware
		linux-firmware
		gvfs
		wl-clipboard
		libsForQt5.dolphin
		nwg-look
		btop
		hwinfo
		ripgrep
		iio-sensor-proxy
		libdrm
		chezmoi
		atuin
		compsize
		busybox
		playerctl
		satty
		xdg-desktop-portal
		xdg-desktop-portal-gtk
		xdg-desktop-portal-hyprland
		nwg-look

		# CLI Apps
		lf
		lsd
		zsh
		vim 
		eza
		git
		fzf
		ctpv
		tree
		p7zip
		zoxide
		colorz
		udiskie
		bluetui
		starship
		fastfetch
		oh-my-posh
		wf-recorder
		spicetify-cli
		unstable.neovim

		# GUI Apps
		bitwarden-desktop
		telegram-desktop
		adwaita-qt
		vivaldi
		kitty

		# Hyprland environment
		sddm
		rofi
		swww
		waybar
		pywal16
		wlogout
		hyprland
		hypridle
		hyprlock
		hyprshot
		hyprshade
		libnotify
		swaynotificationcenter
	];

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
  system.stateVersion = "24.11"; # Did you read the comment?

}
