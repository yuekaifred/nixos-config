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
      alias webcam='mpv av://v4l2:/dev/video3 --demuxer-lavf-o=video_size=1920x1080,framerate=60'

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
