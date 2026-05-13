{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    autosuggestion.enable = true;
    defaultKeymap = "viins";
    syntaxHighlighting.enable = true;
    
    plugins = [
      {
        name = "pure";
        src = pkgs.pure-prompt;
      }
    ];

    initContent = ''
      fpath+=${pkgs.pure-prompt}/share/zsh/site-functions
      autoload -U promptinit; promptinit
      prompt pure
      bindkey -M viins '^?' backward-delete-char
      export EDITOR=nvim

      function claude() {
        local scheme
        scheme=$(gsettings get org.gnome.desktop.interface color-scheme 2>/dev/null)
        local theme="dark"
        [[ "$scheme" == *"light"* ]] && theme="light"
        command claude --settings "{\"theme\":\"$theme\"}" "$@"
      }
    '';
  };
}
