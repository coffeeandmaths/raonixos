{ config, pkgs, ... }:

{
  home.username = "raonixos_u0";
  home.homeDirectory = "/home/raonixos_u0";
  home.stateVersion = "24.05"; # Please read the comment before changing.
  home.packages = [
  ];
  home.file = {
  };
  home.sessionVariables = {
  };
  programs.home-manager.enable = true;
  #-----------------------------------------------------
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ ];
    settings = { ignorecase = true; };
    extraConfig = ''
      set number
      syntax on
      set autoindent
	'';
  };

   # Git in github
 programs.git = {
    enable = true;
    userName = "raonixos_u0";
    userEmail = "raonixos_u0@nixos.com";
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "$HOME/dotfiles";
    };
  };
}



