{
  description = "Nahida's NixOS Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
    catppuccin.url = "github:catppuccin/nix";
    sops-nix.url = "github:Mic92/sops-nix";
    matugen.url = "github:InioX/matugen/v2.2.0";
    daeuniverse.url = "github:daeuniverse/flake.nix";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    impermanence.url = "github:nix-community/impermanence";
    bi2o3.url = "github:Buer-Nahida/Bi2O3";
    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.92.0-3.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox = {
      url = "github:nix-community/flake-firefox-nightly";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    more-waita = {
      url = "github:somepaulo/MoreWaita";
      flake = false;
    };
    life-tip = {
      url = "github:Buer-Nahida/life-tip";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, ... }@inputs:
    let
      nixConfig = {
        substituters = [
          "https://hyprland.cachix.org"
          "https://cache.nixos.org"
          "https://cache.lix.systems"
          "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
          "https://nix-community.cachix.org"
          "https://cache.garnix.io"
        ];
        trusted-public-keys = [
          "cache.lix.systems:aBnZUw8zA7H35Cz2RyKFVs3H4PlGTLawyY5KRbvJR8o="
          "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
          "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        ];
        trusted-users = [
          "root"
          username
        ];
      };
      username = "nahida";
      homeDirectory = "/home/${username}";
      realname = "纳西妲 · Nahida";
      email = "me@nahida.im";
    in
    {
      nixosConfigurations."akasha" = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        specialArgs = {
          inherit
            inputs
            username
            homeDirectory
            realname
            email
            ;
          dirContents =
            dirPath: extraFilterList:
            let
              dir = builtins.readDir dirPath;
              filteredDir = removeAttrs dir (extraFilterList ++ [ "default.nix" ]);
              filesList = builtins.attrNames filteredDir;
              allFiles = map (filename: /${dirPath}/${filename}) filesList;
            in
            allFiles;
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
          lix-module.nixosModules.default
          catppuccin.nixosModules.catppuccin
          impermanence.nixosModules.impermanence
          home-manager.nixosModules.home-manager
        ];
      };
    };
}
