{ config, lib, ... }:

let
  mkSymLink = config.lib.file.mkOutOfStoreSymlink;
  configPath = "${config.home.homeDirectory}/nixos-config/stuff/niri";
in
{
  xdg.configFile = {
    "niri/config.kdl".source = mkSymLink "${configPath}/config.kdl";
    "niri/help.sh".source = mkSymLink "${configPath}/help.sh";
  };
}
