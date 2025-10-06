{ config, pkgs, system, inputs, zen-browser, ... }:

let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/.config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    nvim = "nvim";
    kitty = "kitty";
    hypr = "hypr";
    fastfetch = "fastfetch";
    rofi = "rofi";
    dunst = "dunst";
    waybar = "waybar";
    wlogout = "wlogout";
  };
in 

{
  imports = [
    zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;
    package = (zen-browser.packages.${pkgs.system}.beta or zen-browser.packages.${pkgs.system}.default).overrideAttrs (old: {
      buildInputs = old.buildInputes or [] ++ [ pkgs.libgbm ];
      patches = old.patches or [];
    });
  };

  home.username = "izayaa";
  home.homeDirectory = "/home/izayaa";
  home.stateVersion = "25.05";

  programs.neovim = {
    enable = true;
    extraLuaPackages = luaPackages: with luaPackages; [ magick ];
    extraPackages = [ pkgs.imagemagick ];
  };

  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfiles}/${subpath}";
    recursive = true;
  }) configs;

  home.packages = with pkgs; [
    imagemagick
    ripgrep
    wl-clipboard
    nil
    nixpkgs-fmt
    nodejs
    gcc
    cowsay
    gnumake
    cmake
    nerd-fonts.jetbrains-mono
    jetbrains-mono
    speedtest-cli
    home-manager  
  ];
  
  dconf.settings."org/virt-manager/virt-manager/connections" = {
    autoconnect = [ "qemu:///system" ];
    uris = [ "qemu:///system" ];
  }; 
}
