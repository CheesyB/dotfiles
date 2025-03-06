{
  description = "Home Manager configuration of timb";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # sops-nix.url = "github:mic92/sops-nix";
    # # optional, not necessary for the module
    # sops-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    nixpkgs,
    home-manager,
    # sops-nix,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    homeConfigurations."timb" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      # Specify your home configuration modules here, for example,
      # the path to your home.nix.
      modules = [
        ./home.nix
       # sops-nix.nixosModules.sops
      ];

      # Optionally use extraSpecialArgs
      # to pass through arguments to home.nix
    };
  };
}
