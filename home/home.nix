#       
#            __ _        ___  __                              
#         /\ \ (_)_  __ /___\/ _\   /\  /\___  _ __ ___   ___ 
#        /  \/ / \ \/ ///  //\ \   / /_/ / _ \| '_ ` _ \ / _ \
#       / /\  /| |>  </ \_// _\ \ / __  / (_) | | | | | |  __/
#       \_\ \/ |_/_/\_\___/  \__/ \/ /_/ \___/|_| |_| |_|\___|
#                                                             
#       rkl14
#  

{ config, pkgs, ... }:

{
  # Configuración básica del usuario y su directorio personal.
  home.username = "joaquin";
  home.homeDirectory = "/home/joaquin";

  nixpkgs.config.allowUnfree = true;

  # Lista de paquetes de Nix a instalar en el entorno del usuario.
  home.packages = [
  # ===== Herramientas esenciales del sistema =====
  pkgs.rtkit                # Soporte para la gestión de prioridad de procesos de audio
              # Para montar discos duros NTFS
  pkgs.unzip                # Para descomprimir archivos zip
  pkgs.unrar                # Para descomprimir archivos rar
  pkgs.git                  # Control de versiones
  pkgs.nodejs               # Entorno de ejecución de JavaScript
  pkgs.bun                  # Herramienta de desarrollo para JavaScript y TypeScript
  pkgs.fd                   # Búsqueda rápida en el sistema de archivos
  pkgs.fzf                  # Herramienta de búsqueda interactiva
  pkgs.brightnessctl        # Control de brillo de la pantalla
  pkgs.pavucontrol          # Sistema de archivos virtual de GNOME, lo usa ags para montar dispositivos???
  pkgs.keepassxc           # Gestor de contraseñas

  # ===== Juegos =====
  pkgs.osu-lazer            # Jueguito de ritmo
  # ===== Gestores de ventanas y Wayland =====
  pkgs.hypr                 # Gestor de ventanas Hyprland
  pkgs.hyprpaper            # Para establecer fondos de pantalla en Hyprland
  pkgs.waybar               # Barra de estado para Wayland
  pkgs.rofi-wayland         # Menú de aplicaciones y selector de ventanas

  # ===== Gestión de pantalla y capturas =====
  pkgs.wlr-randr            # Configuración de monitores en Wayland
  pkgs.swww                 # Para fondos de pantalla animados
  pkgs.slurp                # Selección de región para capturas de pantalla
  pkgs.grim                 # Herramienta para capturas de pantalla
  pkgs.wayshot              # Otra herramienta para capturas de pantalla
  pkgs.swappy               # Edición de capturas de pantalla
  pkgs.wf-recorder          # Grabación de pantalla en Wayland
  pkgs.wl-clipboard         # Soporte para el portapapeles en Wayland

  # ===== Navegadores =====
  pkgs.librewolf            # Navegador enfocado en privacidad
  pkgs.firefox              # Navegador web

  # ===== Aplicaciones multimedia =====
  pkgs.flameshot            # Herramienta para capturas de pantalla
  pkgs.obsidian             # Herramienta para tomar notas y gestionar conocimiento
  pkgs.shotcut              # Editor de video
  pkgs.krita                # Software de diseño gráfico y pintura digital
  pkgs.steam                # Plataforma de videojuegos
  pkgs.discord              # Cliente de comunpkgs.icación para comunidades
  pkgs.discord-screenaudio  # Soporte de audiopkgs. en capturas de pantalla compartidas
  pkgs.cava                 # Visualizador de pkgs.audio en la terminal
  pkgs.gpick                # Selector de colores
  pkgs.tty-clock            # Reloj en la terminal
  pkgs.gnome-clocks
  pkgs.spotify              # Reproductor de música
  # ===== Aplicaciones de oficina =====
  pkgs.libreoffice          # Suite de oficina
  pkgs.kdePackages.okular  # Lector de PDF

  # ===== Administradores de archivos =====
  pkgs.pcmanfm              # Administrador de archivos ligero
  pkgs.nautilus 
  pkgs.file-roller

  # ===== Aplicaciones de red =====
  pkgs.networkmanagerapplet # Administrador de redes en el systray
  pkgs.blueman              # Gestor de dispositivos Bluetooth

  # ===== Terminales =====
  pkgs.kitty                # Emulador de terminal
  pkgs.btop                 # Monitor de recursos del sistema
  pkgs.neofetch             # Información del sistema en la terminal

  # ===== Iconos y temas =====
  pkgs.gtk3                 # Soporte para aplicaciones GTK
  pkgs.papirus-icon-theme   # Iconos modernos y populares

  # ===== Desarrollo, trabajo y creacion de contenido  =====
  pkgs.vscode                     # Editor de texto y entorno de desarrollo
  pkgs.dart-sass                  # Compilador Sass para CSS
  pkgs.matugen                    # Herramienta auxiliar para generar configuraciones
  pkgs.hyprpicker                 # Selector de colores en Wayland
  pkgs.ollama
  pkgs.yarn                       #gestor de paquetes que se supone que es mas rapido que npm
  pkgs.vite                       #bundler para proyectos web, diseñado para ser rápido y eficiente.
  pkgs.audacity
  pkgs.nodePackages.json-server   #Servidor mock para poder usar un backend "falso" desde el front con archivos json
  pkgs.warp-terminal              #termnixos.gnome-tweaksinal con ia
  pkgs.dbeaver-bin                #Cliente para bases de datos, usando docker para el servidor
  pkgs.python3                    #python
  pkgs.python3Packages.pip        #gestor de paquetes de python
  pkgs.wineWowPackages.waylandFull #wine con soporte para wayland
  pkgs.bottles                    #gestor de aplicaciones de windows
  pkgs.obs-studio                 #grabador de pantallad     
  pkgs.webcamoid                  #controlador de camaras
  pkgs.celluloid                  #reproductor de video
  pkgs.imv                       #visualizador de imagenes                 
  pkgs.wlroots
  pkgs.kanshi
  pkgs.wofi  
  pkgs.nwg-drawer                 #menu de aplicaciones
  pkgs.exfatprogs                 #para montar discos exfat
  pkgs.gnome-tweaks               #para personalizar gnome
  pkgs.pkgs.droidcam              #camara
  pkgs.kdePackages.ark
  pkgs.p7zip 
  pkgs.telegram-desktop
 
 
  # ===== Software de entrada =====
  pkgs.opentabletdriver # Controlador para tabletas gráficas
  pkgs.plasma5Packages.kdeconnect-kde        # Integración de dispositivos Android con KDE


];

    # Definición de variables de entorno que se cargarán en la shell.
  home.sessionVariables = {
     XDG_DEFAULT_IMAGE_VIEWER = "imv";
     XDG_DEFAULT_VIDEO_PLAYER="celluloid";
  };


  # Gestión de archivos de configuración (dotfiles) con Home Manager.
  home.file = {
    # Ejemplo: vincular el archivo 'screenrc' a la configuración del usuario.
    # ".screenrc".source = dotfiles/screenrc;

    # Ejemplo: establecer contenido personalizado en un archivo.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Permite que Home Manager se administre a sí mismo.
  programs.home-manager.enable = true;

  # Versión de Home Manager utilizada, cambiarla sin precaución podría causar errores.
  home.stateVersion = "24.11";

}
