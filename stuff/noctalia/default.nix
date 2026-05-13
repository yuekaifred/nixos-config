{ config, ... }:

let
  mkSymLink = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.file.".config/noctalia".source =
    mkSymLink "${config.home.homeDirectory}/nixos-config/stuff/noctalia/config";
}
