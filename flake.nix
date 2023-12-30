{
  description = "A flexible documentation generator built on Cheetah.";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    cheetah.url = "github:aleksrutins/cheetah";
  };

  outputs = { self, nixpkgs, flake-utils, cheetah }: flake-utils.lib.eachDefaultSystem (system: 
    let 
      util = import ./util.nix;
      pkgs = (import nixpkgs) { inherit system; };
    in rec {
      lib = rec {
        config = content:
          {
            name = (builtins.baseNameOf /./${content}/..);
            config = {
              always_hydrate = true;
            };
          };

        buildSite = { content }:
          let
            siteConfig = config content;
          in cheetah.buildSite.${system} (import ./sitegen { inherit pkgs content siteConfig; }) siteConfig;
      };

    }
  );
}
