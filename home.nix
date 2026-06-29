{ config, pkgs, inputs, ... }:

{
  home.username = "fred";
  home.homeDirectory = "/home/fred";

  home.packages = with pkgs; [
    chafa         # image viewer for yazi
    clang
    cmake
    claude-code
    cowsay
    delve         # go debugger
    fzf
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
    krita
    nodejs
    python3
    slurp       # region selector; pairs with grim for ss
    unzip
    mpv
    noctalia-shell
    weylus
    obs-studio
    yazi
    wget        # http downloader
    typst
    wl-clipboard
    zathura
    inputs.herdr.packages.${pkgs.system}.default
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
    settings.user.name = "yuekaifred";
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

  home.file.".claude/CLAUDE.md".source = ./misc/claude.md;
  home.file.".claude/skills/herdr/SKILL.md".source = "${inputs.herdr}/SKILL.md";

  imports = [
    ./stuff
  ];

  home.stateVersion = "25.11";
}
