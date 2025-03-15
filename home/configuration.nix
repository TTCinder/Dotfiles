
{ inputs, config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
	  inputs.home-manager.nixosModules.home-manager
     ];
 
  home-manager={
	extraSpecialArgs={inherit inputs;};
	users={
		joaquin = import ./home.nix ;
	};
  };
  nix.settings.experimental-features=["nix-command" "flakes"];


  #Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [ 8081 1714 1715 ];
  networking.firewall.allowedUDPPorts = [ 1714 1715 ];
  # Set your time zone.
  time.timeZone = "America/Santiago";

  # Select internationalisation properties.
  i18n.defaultLocale = "es_AR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_CL.UTF-8";
    LC_IDENTIFICATION = "es_CL.UTF-8";
    LC_MEASUREMENT = "es_CL.UTF-8";
    LC_MONETARY = "es_CL.UTF-8";
    LC_NAME = "es_CL.UTF-8";
    LC_NUMERIC = "es_CL.UTF-8";
    LC_PAPER = "es_CL.UTF-8";
    LC_TELEPHONE = "es_CL.UTF-8";
    LC_TIME = "es_CL.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "es";
    variant = "dvorak";

  };

  # Configure console keymap
  console.keyMap = "es";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.joaquin = {
    isNormalUser = true;
    description = "joaquin";
    extraGroups = [ "networkmanager" "wheel" "video" "docker"];
    packages = with pkgs; [
		git
	];
  };

 #Allow unfree packages
 nixpkgs.config.allowUnfree = true;


 #Habilitar OpenTabletDriver para tableta grafica
 hardware.opentabletdriver.enable = true;
  
environment.systemPackages = with pkgs; [
  gvfs
  glib-networking
  gsettings-desktop-schemas
  ntfs3g 
  papirus-icon-theme
  adwaita-icon-theme
  gnome-icon-theme
  gnome-themes-extra

];

	services.upower.enable = true;
	hardware.bluetooth.enable = true;
	services.blueman.enable = true;
  virtualisation.docker.enable = true;
	services.gnome.gnome-keyring.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true; # Recomendado para compatibilidad con gvfs


  boot.kernelModules = [ "v4l2loopback" ];
  boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
  programs.adb.enable = true;

	programs.hyprland={
 	enable=true;
	xwayland.enable=true;
 	};
	environment.sessionVariables={
	WLR_NO_HARDWARE_CURSORS="1";
	NIXOS_OZONE_WL="1";
	};	
	hardware={
	opengl.enable=true;
	};
	xdg.portal.enable=true;
	xdg.portal.extraPortals=[pkgs.xdg-desktop-portal-gtk];

	#Gestor de sesiones
    services.xserver={
        enable=true;        
		displayManager.gdm.enable = true;
    };
	
	
	#Finalmente Sonido
	security.rtkit.enable=true;
		
	services.pipewire={
	enable=true;
	alsa.enable=true;
	alsa.support32Bit=true;
	pulse.enable=true;
	jack.enable=true;
	wireplumber.enable=true; 	
	};
  services.flatpak.enable = true;  
#Esto permite instalar apps de Flathub, como Bitwarden, Telegram, Zoom, etc.

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };



  # hardware.opengl has beed changed to hardware.graphics

  # services.xserver.videoDrivers = ["amdgpu"];

  #Some programs need SUID wrappers, can be configured further or are
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
  system.stateVersion = "24.05"; # Did you read the comment?

}

