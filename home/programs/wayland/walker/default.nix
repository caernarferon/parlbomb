{ pkgs
, inputs
, osConfig
, ...
}: {
    imports = [
        inputs.walker.homeManagerModules.default
    ];
    programs.walker = {
        enable = true;
    };
}