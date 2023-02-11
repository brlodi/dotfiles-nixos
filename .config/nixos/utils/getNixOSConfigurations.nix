{ machinesDirectory }:

builtins.attrValues (
  builtins.filter (name: builtins.stringLength name > 0) (
    builtins.map (name: {
      imports = [ "${machinesDirectory}/${name}.nix" ];
    }) (builtins.filterSource (path: builtins.endsWith ".nix") (
      builtins.concatStringsSep " " (builtins.attrNames (builtins.readDir machinesDirectory))
    ))
  )
)
