{
  description = "Home Manager configuration of joaquin";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixgl.url = "github:nix-community/nixGL";


  };

  outputs = {self, nixpkgs, home-manager,nixgl,... }@inputs:
    let
      system = "x86_64-linux";
      pkgs =
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [ nixgl.overlay ];
        };
    in
    {

      nixosConfigurations={
        myNixos=nixpkgs.lib.nixosSystem{
          specialArgs={inherit inputs system;};
          modules=[
            ./configuration.nix
          ];
        };
      };
    };
}
