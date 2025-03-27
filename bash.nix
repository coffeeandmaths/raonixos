# Shell prompts and aliases.
{ config, lib, pkgs, ... }:

{
  environment.etc."bash_prompt.sh".text = ''
    if [ "$(id -u)" -eq 0 ]; then
      # Root user: Bright Red NixOS logo and prompt symbol (#)
      export PS1="\[\e[1;31m\]\u \[\e[1;33m\]\w \[\e[1;31m\] #\[\e[0m\] "
    else
      # Normal user: Soft Blue NixOS logo and Green prompt symbol ($)
      export PS1="\[\e[1;32m\]\u \[\e[1;36m\]\w \[\e[1;34m\] \[\e[1;32m\]$\[\e[0m\] "
    fi
  '';

  environment.etc."bash_aliases".text = ''
    alias ll='ls -la'
    alias editg='vim $HOME/dotfiles/configuration.nix'
    alias edith='vim $HOME/dotfiles/home.nix'
    alias updateg='working_dir=pwd; cd $HOME/dotfiles; sudo nixos-rebuild switch --flake .'
    '';

  # Source the script globally
  environment.interactiveShellInit = ''
    if [ -f /etc/bash_prompt.sh ]; then
      source /etc/bash_prompt.sh
    fi

    if [ -f /etc/bash_aliases ]; then
      source /etc/bash_aliases
    fi
  '';
}
