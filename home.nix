{ config, pkgs, ... }:

{
  home.username = "fred";
  home.homeDirectory = "/home/fred";

  home.packages = with pkgs; [
    chafa         # image viewer for yazi
    claude-code
    cowsay
    delve         # go debugger
    fzf
    gcc
    gh
    gnumake
    go
    gopls
    golangci-lint
    (google-chrome.override {
      commandLineArgs = [
        "--ozone-platform=wayland"
        "--password-store=gnome-libsecret"
        "--enable-features=VaapiVideoDecodeLinuxGL"
        "--use-gl=angle"
        "--use-angle=gl"
      ];
    })
    grim        # ss tool
    nodejs
    python3
    slurp       # region selector; pairs with grim for ss
    unzip
    noctalia-shell
    yazi
    wget        # http downloader
    typst
    wl-clipboard
    zathura
  ];

  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "monospace:size=13";
        include = "~/.cache/noctalia/foot-colors.ini";
      };
      tweak = {
        sixel = true;
      };
    };
  };
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.git = {
    enable = true;
    settings.user.name = "fyang151";
    settings.user.email = "fyang151@gmail.com";
  };
  programs.ssh = {
    enable = true;

    matchBlocks = {
      "github.com" = {
        user = "git";
        identityFile = "~/.ssh/id_ed25519";
      };
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    name = "capitaine-cursors";
    package = pkgs.capitaine-cursors;
    size = 24;
  };

  gtk.enable = true;
  gtk.font = {
    name = "Comic Mono";
    size = 11;
  };

  fonts.fontconfig.defaultFonts = {
    monospace = [ "Comic Mono" ];
    sansSerif = [ "Comic Mono" ];
    serif = [ "Comic Mono" ];
  };

  imports = [
    ./stuff
  ];

  home.stateVersion = "25.11";
}
