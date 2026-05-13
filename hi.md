distro: nixos
wm: niri
terminal emulator: foot
editor: nvim
shell: zsh
prettiness: noctalia shell (should kill soon)

### nixos
this config uses nix flakes with a single host and home manager integrated as a nixos module.
-`flake.nix`: flakes are basically just a nix expression that outputs some config. in this case, it is taking nixpkgs unstable + the home manager module + nixvim module and gives a single nixos config output. this can be used in other ways! like... ummmm.... idk....
- `home.nix`: contains configuration for home. but whats the difference between this and `configuration.nix`? good question! `configuration.nix` is for system level stuff and this is for home packages. um.
- `hosts/`: contains configurations. `hardware-configuration.nix` is for the machine, `configuration.nix` is for the system.
- `stuff/`: config for applications that are a bit too large or important!
- `misc/`: config that dont fit neatly anywhere. for example, i copy paste `vimiumc-mappings.txt` into chrome
- `wallpapers/`: wallpapers

### ~~neovim~~ nixvim
i use nixvim to configure neovim stuffs.

### niri
the config is symlinked to `~/.config`.
it includes `./noctalia.kdl` for the colourscheme. noctalia generates this file in `.config/niri` for me automatically on theme switch. 

## noctalia shell
also symlinked. i just use this for a status bar, colour generation system, notifications, and a little more than that. its ok but im very picky over how my system should look.

everytime i switch to a new theme noctalia reapplies colours to foot and neovim using a template system.
