{ config, pkgs, ... }:

{
  imports= [
  ];
  home.username = "raonixos_u0";
  home.homeDirectory = "/home/raonixos_u0";
  home.stateVersion = "24.05"; # Please read the comment before changing.
  home.packages = with pkgs; [
      libreoffice-qt
      imagemagick
    ];
  home.file = {
  };
  home.sessionVariables = {
  };
  programs.home-manager.enable = true;
  #-----------------------------------------------------
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      edit = "sudo -e";
      update = "sudo nixos-rebuild switch";
    };

    history.size = 10000;
    history.ignoreAllDups = true;
    history.path = "$HOME/.zsh_history";
    history.ignorePatterns = ["rm *" "pkill *" "cp *"];

     plugins = [
    {
      name = "zsh-autocomplete";
      src = pkgs.fetchFromGitHub {
        owner = "marlonrichert";
        repo = "zsh-autocomplete";
        rev = "23.07.13";
        sha256 = "sha256-/6V6IHwB5p0GT1u5SAiUa20LjFDSrMo731jFBq/bnpw=";
     };
     }

     {
      name = "zsh-syntax-highlighting";
      src = pkgs.fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-syntax-highlighting";
        rev = "0.8.0";
        sha256 = "sha256-iJdWopZwHpSyYl5/FQXEW7gl/SrKaYDEtTH9cGP7iPo=";
      };
    }

     ];
     };

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



