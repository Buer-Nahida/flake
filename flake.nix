{
  description = "Nahida's NixOS Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/24.05";
    nur.url = "github:nix-community/NUR";
    catppuccin.url = "github:catppuccin/nix";
    ags.url = "github:Aylur/ags";
    sops-nix.url = "github:Mic92/sops-nix";
    matugen.url = "github:InioX/matugen/v2.2.0";
    astal.url = "github:Aylur/astal";
    daeuniverse.url = "github:daeuniverse/flake.nix";
    firefox = {
      url = "github:nix-community/flake-firefox-nightly";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    more-waita = {
      url = "github:somepaulo/MoreWaita";
      flake = false;
    };
    get-traffic = {
      url = "github:Buer-Nahida/get-traffic";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    wezterm = {
      url = "github:wez/wezterm/main?dir=nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, ... }@inputs:
    let
      nixConfig = {
        substituters = [
          "https://hyprland.cachix.org"
          "https://cache.nixos.org"
          "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
          "https://nix-community.cachix.org"
          "https://cache.garnix.io"
        ];
        trusted-public-keys = [
          "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
          "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        ];
        trusted-users = [ "root" username ];
      };
      username = "nahida";
      homeDirectory = "/home/${username}";
      realname = "纳西妲 · Nahida";
      email = "yanwenz551@gmail.com";
    in {
      nixosConfigurations."akasha" = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs system username homeDirectory realname email;
          pkgs-stable = import inputs.nixpkgs-stable {
            inherit system;
            config.allowUnfree = true;
          };
          dirContents = dirPath: extraFilterList:
            let
              dir = builtins.readDir dirPath;
              filteredDir =
                removeAttrs dir (extraFilterList ++ [ "default.nix" ]);
              filesList = builtins.attrNames filteredDir;
              allFiles = map (filename: /${dirPath}/${filename}) filesList;
            in allFiles;
        };
        modules = with inputs; [
          ./home
          ./modules
          ./programs
          ./hosts/akasha
          { nix.settings = nixConfig; }
          { system.stateVersion = "23.11"; }
          { home-manager.extraSpecialArgs = specialArgs; }
          nur.modules.nixos.default
          sops-nix.nixosModules.sops
          daeuniverse.nixosModules.dae
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
        ];
      };
    };
}
