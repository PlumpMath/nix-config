{
  description = "gvolpe's Home Manager & NixOS configurations";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    nixpkgs-nautilus-gtk3.url = "github:NixOS/nixpkgs?ref=37bd398";

    nurpkgs.url = "github:nix-community/NUR";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    homeage = {
      url = "github:jordanisaacs/homeage?ref=323037e";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-flake.url = "github:GuruPoo/neovim-flake";

    # Fish shell

    fish-bobthefish-theme = {
      url = "github:gvolpe/theme-bobthefish";
      flake = false;
    };

    fish-keytool-completions = {
      url = "github:ckipp01/keytool-fish-completions";
      flake = false;
    };

    # Github Markdown ToC generator

    gh-md-toc = {
      url = "github:ekalinin/github-markdown-toc";
      flake = false;
    };

    # LaTeX stuff

    tex2nix = {
      url = "github:Mic92/tex2nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    let system = "x86_64-linux"; in
    {
      homeConfigurations = (
        import ./outputs/home-conf.nix {
          inherit inputs system;
        }
      );

      nixosConfigurations = (
        import ./outputs/nixos-conf.nix {
          inherit inputs system;
        }
      );
    };
}
