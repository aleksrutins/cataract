{ pkgs, siteConfig, content }:
let util = import ../util.nix;
in pkgs.stdenv.mkDerivation {
  name = "cataract-generated-" + (siteConfig.name);

}