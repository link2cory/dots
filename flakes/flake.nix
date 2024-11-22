{

 	description = "My first flake!";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-24.05";
		home-manager.url = "github:nix-community/home-manager/release-24.05";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
    zen-browser.url = "github:MarceColl/zen-browser-flake";
	};

	outputs = { self, nixpkgs, home-manager, zen-browser,  ... }:
	let
		lib = nixpkgs.lib;
		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
	in  {
		nixosConfigurations = {
			mini = lib.nixosSystem {
				inherit system;
				modules = [ 
          ./configuration.nix 
          {
            environment.systemPackages = [
              zen-browser.packages.${system}.default
            ];
          }
        ];
			};
		};
		homeConfigurations = {
			cory = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				modules = [ ./home.nix ];
			};
		};
	};
}
