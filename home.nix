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

  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfiles}/${subpath}";
    recursive = true;
  }) configs;

  home.packages = with pkgs; [
    neovim
    ripgrep
    nil
    nixpkgs-fmt
    nodejs
    gcc
    nerd-fonts.jetbrains-mono
    jetbrains-mono
    speedtest-cli
    home-manager
  ];
}
